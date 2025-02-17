using System;
using Sport.UI;

namespace Sportsman.Entities
{
	public class AccountView : EntityView
	{
		public AccountView()
			: base (Sport.Entities.Account.Type)
		{
			//
			// Entity
			//
			Name = "�����";
			PluralName = "�������";

			//
			// Fields
			//

			// Id
			EntityFieldView efv = Fields[(int) Sport.Entities.Account.Fields.Id];
			efv.Name = "���";
			efv.Width = 30;
			// Region
			efv = Fields[(int) Sport.Entities.Account.Fields.Region];
			efv.Name = "����";
			efv.Width = 150;
			efv.Values = Sport.Entities.Region.Type.GetEntities(null);
			// Name
			efv = Fields[(int) Sport.Entities.Account.Fields.Name];
			efv.Name = "�� �����";
			efv.Width = 180;
			// School
			efv = Fields[(int) Sport.Entities.Account.Fields.School];
			efv.Name = "��� ���";
			efv.Width = 180;
			efv.CanEdit = false;
			// School Symbol
			efv = Fields[(int)Sport.Entities.Account.Fields.SchoolSymbol];
			efv.Name = "��� ��� ���";
			efv.Width = 150;
			efv.CanEdit = false;
			// Balance
			efv = Fields[(int) Sport.Entities.Account.Fields.Balance];
			efv.Name = "����";
			efv.Width = 120;
			efv.CanEdit = false;
			// Address
			efv = Fields[(int) Sport.Entities.Account.Fields.Address];
			efv.Name = "�����";
			efv.Width = 150;
			// LastModified
			efv = Fields[(int) Sport.Entities.Account.Fields.LastModified];
			efv.Name = "�' ����� �����";
			efv.Width = 120;
		}

		public override void OnSelectEntity(Sport.Data.Entity entity)
		{
			if (entity != null)
			{
				Sport.Entities.Account account = new Sport.Entities.Account(entity);
				Sport.Entities.School school = null;
				try
				{
					school = account.School;
				}
				catch
				{
					//sanity check, no need to panick.
				}

				Fields[(int) Sport.Entities.Account.Fields.Name].CanEdit = (school == null);
			}
		}

	}
}
