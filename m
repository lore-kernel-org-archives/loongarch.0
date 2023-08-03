Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7477463D1
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 02:22:37 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8BxY_BnD8tkHWoPAA--.36130S3;
	Thu, 03 Aug 2023 10:22:31 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_c4yD8tk8oNGAA--.51268S32;
	Thu, 03 Aug 2023 10:22:26 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	maobibo@loongson.cn,
	Xi Ruoyao <xry111@xry111.site>,
	zhaotianrui@loongson.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v18 30/30] LoongArch: KVM: Add maintainers for LoongArch KVM
Date: Thu,  3 Aug 2023 10:21:38 +0800
Message-Id: <20230803022138.2736430-31-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230803022138.2736430-1-zhaotianrui@loongson.cn>
References: <20230803022138.2736430-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx_c4yD8tk8oNGAA--.51268S32
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add maintainers for LoongArch KVM.

Acked-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aee340630eca..4cd9067dad12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11425,6 +11425,18 @@ F:	include/kvm/arm_*
 F:	tools/testing/selftests/kvm/*/aarch64/
 F:	tools/testing/selftests/kvm/aarch64/
 
+KERNEL VIRTUAL MACHINE FOR LOONGARCH (KVM/LoongArch)
+M:	Tianrui Zhao <zhaotianrui@loongson.cn>
+M:	Bibo Mao <maobibo@loongson.cn>
+M:	Huacai Chen <chenhuacai@kernel.org>
+L:	kvm@vger.kernel.org
+L:	loongarch@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
+F:	arch/loongarch/include/asm/kvm*
+F:	arch/loongarch/include/uapi/asm/kvm*
+F:	arch/loongarch/kvm/
+
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
 L:	linux-mips@vger.kernel.org
-- 
2.39.1

