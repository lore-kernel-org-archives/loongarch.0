Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB891635
	for <loongarch@lists.linux.dev>; Thu,  4 Aug 2022 02:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41510C433C1;
	Thu,  4 Aug 2022 02:54:44 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] irqchip/loongson-eiointc: Fix a build warning
Date: Thu,  4 Aug 2022 10:54:57 +0800
Message-Id: <20220804025457.213979-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make acpi_get_vec_parent() be a static function, to avoid:
drivers/irqchip/irq-loongson-eiointc.c:289:20: warning: no previous prototype for 'acpi_get_vec_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index 317467857478..bffb7b3128e8 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -290,7 +290,7 @@ static void acpi_set_vec_parent(int node, struct irq_domain *parent, struct acpi
 	}
 }
 
-struct irq_domain *acpi_get_vec_parent(int node, struct acpi_vector_group *vec_group)
+static struct irq_domain *acpi_get_vec_parent(int node, struct acpi_vector_group *vec_group)
 {
 	int i;
 
-- 
2.31.1

