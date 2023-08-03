Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082997E
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 09:03:24 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8CxtPBVbctkk5kPAA--.36886S3;
	Thu, 03 Aug 2023 17:03:18 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxzyNUbctkR_VGAA--.11096S2;
	Thu, 03 Aug 2023 17:03:16 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: loongson3_defconfig: Compile ast drm driver as module by default
Date: Thu,  3 Aug 2023 17:03:16 +0800
Message-Id: <20230803090316.971075-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxzyNUbctkR_VGAA--.11096S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZw1Utw1kGF1kZFW3CF4UGFX_yoW3Krb_Ja
	42ka1Uur4FyayDWw1xX3yruws0v3WUJF1SyFnrXr1xX3Wjyr1aqr1vq343CFn0g34DGrW5
	XaykJFyDCF10qosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2AR6DUUUU

ASpeed GPU is typically found on the Loongson server platform,
as a peripheral device driver, it generally should be compiled as a module.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 6cd26dd3c134..dbf16aa85d8f 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -640,7 +640,7 @@ CONFIG_DRM_AMDGPU=m
 CONFIG_DRM_AMDGPU_SI=y
 CONFIG_DRM_AMDGPU_CIK=y
 CONFIG_DRM_AMDGPU_USERPTR=y
-CONFIG_DRM_AST=y
+CONFIG_DRM_AST=m
 CONFIG_DRM_QXL=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y
-- 
2.34.1

