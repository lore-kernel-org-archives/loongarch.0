Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B0314018
	for <loongarch@lists.linux.dev>; Fri, 17 Nov 2023 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8Bx5fDpUldlScs6AA--.51187S3;
	Fri, 17 Nov 2023 19:47:53 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxL93mUldl705FAA--.23797S3;
	Fri, 17 Nov 2023 19:47:52 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org
Cc: Yanteng Si <siyanteng@loongson.cn>,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	wu.xiangcheng@linux.dev,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 1/2] Docs/LoongArch: Update arch LoongArch introduction.rst
Date: Fri, 17 Nov 2023 19:47:47 +0800
Message-Id: <921854520b3a24fded927ab9e0cee18d11fa4e43.1700221148.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1700221148.git.siyanteng@loongson.cn>
References: <cover.1700221148.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxL93mUldl705FAA--.23797S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary3Gr4rCFyrKrWDXF1rZrc_yoW8Jw4rpw
	10vr92gr45twn8W34kKa45WF40vFZ3GF4xCFsFkw18GFnrZ3Wvyayrtrn8XF1UA348AFWI
	q3s5Gw4FyF15AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfUUUUU=

LoongArch-Vol1 has been updated to v1.10, the links in the
documentation are out of date, let's update it.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/arch/loongarch/introduction.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/loongarch/introduction.rst b/Documentation/arch/loongarch/introduction.rst
index 8c568cfc2107..5e6db78abeaf 100644
--- a/Documentation/arch/loongarch/introduction.rst
+++ b/Documentation/arch/loongarch/introduction.rst
@@ -375,9 +375,9 @@ Developer web site of Loongson and LoongArch (Software and Documentation):
 
 Documentation of LoongArch ISA:
 
-  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.02-CN.pdf (in Chinese)
+  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.10-CN.pdf (in Chinese)
 
-  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.02-EN.pdf (in English)
+  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.10-EN.pdf (in English)
 
 Documentation of LoongArch ELF psABI:
 
-- 
2.31.4

