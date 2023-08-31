Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57B579F8
	for <loongarch@lists.linux.dev>; Thu, 31 Aug 2023 11:43:20 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8AxZ+jWfPBkFm8dAA--.24213S3;
	Thu, 31 Aug 2023 19:43:18 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxniPTfPBkVxJoAA--.14619S2;
	Thu, 31 Aug 2023 19:43:16 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/5] soc: loongson: Fix some issues about loongson_pm2
Date: Thu, 31 Aug 2023 19:43:10 +0800
Message-Id: <cover.1693474728.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxniPTfPBkVxJoAA--.14619S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr1DXrWDZFWxWF4rCF15GFX_yoW8Xw4UpF
	9xC3s8Gr45Zry7ArnxJFW8GFWrXrZ5AF9rJF4xJw17CryDXw1jvrWrtFWjvrZxAFyfXwsI
	vr1xGrW8WFnrurcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Hi all:

Since commit 67694c076bd7 ("soc: loongson2_pm: add power management support"),
the Loongson-2K PM driver was added, some issues have been found and
this patchset is planned to fix these issues.

Specific:
Patch 1: Compilation error found by Randy;
Patch 2/3: Rewriting the ls2k-pmc compatible attribute with fallback
compatible;
Patch 4/5: Add Loongson-2K SoC reboot/shutdown support as part of power
management.

Thanks.

-----
V2:
patch 1:
 - Change "depends on INPUT" to "depends on INPUT=y", because the
   compilation error still exists when "INPUT=m".
patch 2:
  - Use ls2k0500 as the fallback compatible;
  - Add ls2k2000 compatible.
patch 3:
 - Drop ls2k1000 compatible, for ls2k0500 is used as the fallback
   compatible.
patch 4:
  - Drop label;
  - Drop regmap property in syscon-reboot, for it's deprecated;
  - Add missing space.

Link to V1:
https://lore.kernel.org/all/cover.1693218539.git.zhoubinbin@loongson.cn/

Binbin Zhou (5):
  soc: loongson: loongson_pm2: Add dependency for INPUT
  dt-bindings: soc: loongson,ls2k-pmc: Use fallbacks for ls2k-pmc
    compatible
  soc: loongson: loongson_pm2: Drop useless of_device_id compatible
  dt-bindings: soc: loongson,ls2k-pmc: Allow
    syscon-reboot/syscon-poweroff as child
  soc: loongson: loongson_pm2: Populate children syscon nodes

 .../soc/loongson/loongson,ls2k-pmc.yaml       | 43 ++++++++++++++++---
 drivers/soc/loongson/Kconfig                  |  1 +
 drivers/soc/loongson/loongson2_pm.c           |  7 ++-
 3 files changed, 44 insertions(+), 7 deletions(-)

-- 
2.39.3

