Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCC249F83
	for <loongarch@lists.linux.dev>; Fri, 17 Nov 2023 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8CxNvHnUldlQcs6AA--.50079S3;
	Fri, 17 Nov 2023 19:47:52 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxL93mUldl705FAA--.23797S2;
	Fri, 17 Nov 2023 19:47:51 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org
Cc: Yanteng Si <siyanteng@loongson.cn>,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	wu.xiangcheng@linux.dev,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 0/2] Docs/LoongArch: Update links in the introduction.rst
Date: Fri, 17 Nov 2023 19:47:46 +0800
Message-Id: <cover.1700221148.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxL93mUldl705FAA--.23797S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4c8EcI0En4kS14v26r126r1DMxAqzxv26xkF7I0En4kS14v26r126r1D
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwMKuUUUUU

LoongArch-Vol1 has been updated to v1.10, the links in the
documentation are out of date. That means, everyone can't
download it, let's update it.

Yanteng Si (2):
  Docs/LoongArch: Update arch LoongArch introduction.rst
  Docs/zh_CN/LoongArch: Update arch LoongArch introduction.rst

 Documentation/arch/loongarch/introduction.rst                 | 4 ++--
 .../translations/zh_CN/arch/loongarch/introduction.rst        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.31.4

