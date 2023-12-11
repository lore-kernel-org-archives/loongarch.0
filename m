Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBF220DF1
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.254])
	by gateway (Coremail) with SMTP id _____8BxbOmD4nZljwEAAA--.36S3;
	Mon, 11 Dec 2023 18:20:51 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.254])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxjd6A4nZlgnBbAA--.7604S2;
	Mon, 11 Dec 2023 18:20:49 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: andrew@lunn.ch,
	tsbogend@alpha.franken.de
Cc: Yanteng Si <siyanteng@loongson.cn>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	chenhuacai@loongson.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v1 net 0/3] Some bug fixes
Date: Mon, 11 Dec 2023 18:20:32 +0800
Message-Id: <cover.1702289232.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxjd6A4nZlgnBbAA--.7604S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtrW5GFy8tF1kXrW5AF43urX_yoWfWFX_CF
	Z3K348GF4fWFW7J3s29Fs8Zr1agrWDG3W5CFW5JF4fW39rtrnxZrWUCFZ7WF17WFWa9rs3
	Jr4vgr1rCwn7WosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4SoGDUUUU

* Put Krzysztof's patch into my thread, pick Conor's Reviewed-by
  tag and Jiaxun's Acked-by tag.(prev version is RFC patch)

* I fixed an Oops related to mdio, mainly to ensure that
  mdio is initialized before use, because it will be used
  in a series of patches I am working on.

see <https://lore.kernel.org/loongarch/cover.1699533745.git.siyanteng@loongson.cn/T/#t>


Krzysztof Kozlowski (2):
  stmmac: dwmac-loongson: drop useless check for compatible fallback
  MIPS: dts: loongson: drop incorrect dwmac fallback compatible

Yanteng Si (1):
  stmmac: dwmac-loongson: Make sure MDIO is initialized before use

 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  3 +--
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  3 +--
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 19 ++++++-------------
 3 files changed, 8 insertions(+), 17 deletions(-)

-- 
2.31.4

