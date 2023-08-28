Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C4A613F
	for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 12:38:54 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8Dxg_Bclexk7IAcAA--.58491S3;
	Mon, 28 Aug 2023 20:38:52 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx5sxalexkNrJlAA--.29195S2;
	Mon, 28 Aug 2023 20:38:51 +0800 (CST)
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
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/5] soc: loongson: Fix some issues about loongson_pm2
Date: Mon, 28 Aug 2023 20:38:30 +0800
Message-Id: <cover.1693218539.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx5sxalexkNrJlAA--.29195S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrW3JrW3tr13Ww1kuw47WrX_yoWDAwbE9a
	4Iqay8Jry3AF9rJayUXr48urW3WrWxZ3W0kF1Utr18W34Yyry5Xr1DurnxWFy3Xryjqr98
	Xr48Wr4rAry0gosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jYSoJUUUUU=

Hi all:

Since commit 67694c076bd7 ("soc: loongson2_pm: add power management support"),
the Loongson-2K PM driver was added, some issues have been found and
this patch set is planned to fix these issues.

Specific:
Patch 1: Compilation error found by Randy;
Patch 2/3: Add Loongson-2K2000 support;
Patch 4/5: Add Loongson-2K SoC reboot/shutdown support as part of power
management.

Thanks.

Binbin Zhou (5):
  soc: loongson: loongson_pm2: add dependency for INPUT
  dt-bindings: soc: loongson,ls2k-pmc: Add missing compatible for
    Loongson-2K2000
  soc: loongson: loongson_pm2: Add missing compatible for
    Loongson-2K2000
  dt-bindings: soc: loongson,ls2k-pmc: Allow
    syscon-reboot/syscon-poweroff as child
  soc: loongson: loongson_pm2: Populate children syscon nodes

 .../soc/loongson/loongson,ls2k-pmc.yaml       | 30 ++++++++++++++++++-
 drivers/soc/loongson/Kconfig                  |  1 +
 drivers/soc/loongson/loongson2_pm.c           |  7 +++++
 3 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.39.3

