Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B8338F94
	for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 08:57:50 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxNvGNYgllbd0pAA--.14486S3;
	Tue, 19 Sep 2023 16:57:49 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxfNyKYgll12MLAA--.22712S4;
	Tue, 19 Sep 2023 16:57:49 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] docs/zh_CN/LoongArch: Update the links of ABI
Date: Tue, 19 Sep 2023 16:57:46 +0800
Message-Id: <1695113866-20120-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1695113866-20120-1-git-send-email-yangtiezhu@loongson.cn>
References: <1695113866-20120-1-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxfNyKYgll12MLAA--.22712S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJrW5Cr1rWFW7uF1fZr4UZFc_yoW8AryUpr
	WvkrWxKFnrCr1Uu34kKa4UWF409FZ7Wa17GF4Utw1FgFnrZa4vvrWrtr15tF13Z34rAFWI
	q34Fkw48XF15ZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

The current links of ABI can not be found for some time, let us fix
the broken links.

By the way, the latest and official ABI documentation releases are
available at https://github.com/loongson/la-abi-specs, but there are
no Chinese and pdf versions for now, so just do the minimal changes
to update the links so that they can be found, hope there are stable
links in the future.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/translations/zh_CN/arch/loongarch/introduction.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/arch/loongarch/introduction.rst b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
index cba04be..59d6bf3 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
@@ -344,9 +344,9 @@ LoongArch指令集架构的文档：
 
 LoongArch的ELF psABI文档：
 
-  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-ELF-ABI-v2.00-CN.pdf （中文版）
+  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-ELF-ABI-v2.01-CN.pdf （中文版）
 
-  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-ELF-ABI-v2.00-EN.pdf （英文版）
+  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-ELF-ABI-v2.01-EN.pdf （英文版）
 
 Loongson与LoongArch的Linux内核源码仓库：
 
-- 
2.1.0

