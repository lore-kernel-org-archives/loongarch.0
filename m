Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2A7C
	for <loongarch@lists.linux.dev>; Wed,  2 Nov 2022 06:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477B1C4347C;
	Wed,  2 Nov 2022 06:50:39 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Cc: loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] ACPI / table: Print CORE_PIC information when MADT is parsed
Date: Wed,  2 Nov 2022 14:48:38 +0800
Message-Id: <20221102064838.2615669-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When MADT is parsed, print CORE_PIC information as below:

ACPI: CORE PIC (processor_id[0x00] core_id[0x00] enabled)
ACPI: CORE PIC (processor_id[0x01] core_id[0x01] enabled)
...
ACPI: CORE PIC (processor_id[0xff] core_id[0xff] enabled)

This debug information will be very helpful to bring up early systems to
see if processor_id and core_id are matched or not as spec defined.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/acpi/tables.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 47ec11d4c68e..23bff77b09f4 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -210,6 +210,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 		}
 		break;
 
+	case ACPI_MADT_TYPE_CORE_PIC:
+		{
+			struct acpi_madt_core_pic *p =
+			    (struct acpi_madt_core_pic *)header;
+			pr_debug("CORE PIC (processor_id[0x%02x] core_id[0x%02x] %s)\n",
+				 p->processor_id, p->core_id,
+				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+		}
+		break;
+
 	default:
 		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
 			header->type);
-- 
2.31.1

