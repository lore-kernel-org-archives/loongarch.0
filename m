Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B34655
	for <loongarch@lists.linux.dev>; Wed,  2 Nov 2022 06:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BE5C433C1;
	Wed,  2 Nov 2022 06:49:52 +0000 (UTC)
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
Subject: [PATCH] Revert "LoongArch: Provisionally add ACPICA data structures"
Date: Wed,  2 Nov 2022 14:47:50 +0800
Message-Id: <20221102064750.2609503-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit af6a1cfa6859dab4a843 ("LoongArch: Provisionally add
ACPICA data structures") to fix build error for linux-next on LoongArch,
since acpica is merged to linux-pm.git now.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/acpi.h | 142 ------------------------------
 1 file changed, 142 deletions(-)

diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 17162f494b9b..825c2519b9d1 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -31,148 +31,6 @@ static inline bool acpi_has_cpu_in_madt(void)
 
 extern struct list_head acpi_wakeup_device_list;
 
-/*
- * Temporary definitions until the core ACPICA code gets updated (see
- * 1656837932-18257-1-git-send-email-lvjianmin@loongson.cn and its
- * follow-ups for the "rationale").
- *
- * Once the "legal reasons" are cleared and that the code is merged,
- * this can be dropped entierely.
- */
-#if (ACPI_CA_VERSION == 0x20220331 && !defined(LOONGARCH_ACPICA_EXT))
-
-#define LOONGARCH_ACPICA_EXT	1
-
-#define	ACPI_MADT_TYPE_CORE_PIC		17
-#define	ACPI_MADT_TYPE_LIO_PIC		18
-#define	ACPI_MADT_TYPE_HT_PIC		19
-#define	ACPI_MADT_TYPE_EIO_PIC		20
-#define	ACPI_MADT_TYPE_MSI_PIC		21
-#define	ACPI_MADT_TYPE_BIO_PIC		22
-#define	ACPI_MADT_TYPE_LPC_PIC		23
-
-/* Values for Version field above */
-
-enum acpi_madt_core_pic_version {
-	ACPI_MADT_CORE_PIC_VERSION_NONE = 0,
-	ACPI_MADT_CORE_PIC_VERSION_V1 = 1,
-	ACPI_MADT_CORE_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
-};
-
-enum acpi_madt_lio_pic_version {
-	ACPI_MADT_LIO_PIC_VERSION_NONE = 0,
-	ACPI_MADT_LIO_PIC_VERSION_V1 = 1,
-	ACPI_MADT_LIO_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
-};
-
-enum acpi_madt_eio_pic_version {
-	ACPI_MADT_EIO_PIC_VERSION_NONE = 0,
-	ACPI_MADT_EIO_PIC_VERSION_V1 = 1,
-	ACPI_MADT_EIO_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
-};
-
-enum acpi_madt_ht_pic_version {
-	ACPI_MADT_HT_PIC_VERSION_NONE = 0,
-	ACPI_MADT_HT_PIC_VERSION_V1 = 1,
-	ACPI_MADT_HT_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
-};
-
-enum acpi_madt_bio_pic_version {
-	ACPI_MADT_BIO_PIC_VERSION_NONE = 0,
-	ACPI_MADT_BIO_PIC_VERSION_V1 = 1,
-	ACPI_MADT_BIO_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
-};
-
-enum acpi_madt_msi_pic_version {
-	ACPI_MADT_MSI_PIC_VERSION_NONE = 0,
-	ACPI_MADT_MSI_PIC_VERSION_V1 = 1,
-	ACPI_MADT_MSI_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
-};
-
-enum acpi_madt_lpc_pic_version {
-	ACPI_MADT_LPC_PIC_VERSION_NONE = 0,
-	ACPI_MADT_LPC_PIC_VERSION_V1 = 1,
-	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
-};
-
-#pragma pack(1)
-
-/* Core Interrupt Controller */
-
-struct acpi_madt_core_pic {
-	struct acpi_subtable_header header;
-	u8 version;
-	u32 processor_id;
-	u32 core_id;
-	u32 flags;
-};
-
-/* Legacy I/O Interrupt Controller */
-
-struct acpi_madt_lio_pic {
-	struct acpi_subtable_header header;
-	u8 version;
-	u64 address;
-	u16 size;
-	u8 cascade[2];
-	u32 cascade_map[2];
-};
-
-/* Extend I/O Interrupt Controller */
-
-struct acpi_madt_eio_pic {
-	struct acpi_subtable_header header;
-	u8 version;
-	u8 cascade;
-	u8 node;
-	u64 node_map;
-};
-
-/* HT Interrupt Controller */
-
-struct acpi_madt_ht_pic {
-	struct acpi_subtable_header header;
-	u8 version;
-	u64 address;
-	u16 size;
-	u8 cascade[8];
-};
-
-/* Bridge I/O Interrupt Controller */
-
-struct acpi_madt_bio_pic {
-	struct acpi_subtable_header header;
-	u8 version;
-	u64 address;
-	u16 size;
-	u16 id;
-	u16 gsi_base;
-};
-
-/* MSI Interrupt Controller */
-
-struct acpi_madt_msi_pic {
-	struct acpi_subtable_header header;
-	u8 version;
-	u64 msg_address;
-	u32 start;
-	u32 count;
-};
-
-/* LPC Interrupt Controller */
-
-struct acpi_madt_lpc_pic {
-	struct acpi_subtable_header header;
-	u8 version;
-	u64 address;
-	u16 size;
-	u8 cascade;
-};
-
-#pragma pack()
-
-#endif
-
 #endif /* !CONFIG_ACPI */
 
 #define ACPI_TABLE_UPGRADE_MAX_PHYS ARCH_LOW_ADDRESS_LIMIT
-- 
2.31.1

