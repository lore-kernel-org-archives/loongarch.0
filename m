Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07FD18EA5
	for <loongarch@lists.linux.dev>; Mon, 15 Apr 2024 02:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713148314; cv=none; b=Gig/73APn16vuBCxCHgI78nd0W2GEl2KYriH/pBG1m9NuQzjdttEx55uqAdyQEillJatZm2XT/ZIgZp8ymuGh4Mht/96+ZCeBzXTWzo7+4GSitkQIFRKgA1GLAmH7+DN8bsGK9PXOSdkh8zBVjd5mWkbYsaz3Hlb30Lmzffomug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713148314; c=relaxed/simple;
	bh=yC9VuY3rBArlxLJwyUUE+Fyn/S3XWt8lYJYJoYEDWKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEfhWUKzvDXjwr2/k1mh744+bgJ3Ad35833tGfJY+dvEN6zuxDO7OgKSlzENwe3UhLDH9DPnM8Wz+vUunenyu1es4YDXNbwjYrOyKJFqyAmYm2gW6qbY2graw/PqC+qduyzcRbpA55h4+XshlrrLWiHD4Xl3StoqLdspTIvoosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxvruVkRxmd44nAA--.10238S3;
	Mon, 15 Apr 2024 10:31:49 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxRRGRkRxm+Bx7AA--.27668S2;
	Mon, 15 Apr 2024 10:31:45 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/4] thermal: loongson2: Add Loongson-2K0500 and Loongson-2K2000 thermal support
Date: Mon, 15 Apr 2024 10:31:29 +0800
Message-ID: <cover.1713147645.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxRRGRkRxm+Bx7AA--.27668S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XryDtw17tF1rXFy3Zry5Awc_yoWkuFXEkF
	ySqa48Jw17GF13KFW2gr4xG3s3WFWq934rCFW8try2g34xtFyqvrWqkr9xWa1fWrs8uF15
	X3ykGr1fA34xWosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

Hi all:

This patchset introduce the Loongson-2K0500 and Loongson-2K2000
temperature sensors.

The temperature sensors of Loongson-2K series CPUs are similar, except
that the temperature reading method of the Loongson-2K2000 is
different.

Specifically, the temperature output register of the Loongson-2K2000 is
defined in the chip configuration domain. We need to define it in dts
and calculate it using different calculation methods.

Thanks.

---
V2:
patch(2/4):
 - Add Acked-by tag from Rob, Thanks.
patch(3/4):
 - Add "minItems: 2" to the reg attribute of Loongson-2K2000.

Link to V1:
https://lore.kernel.org/all/cover.1712733065.git.zhoubinbin@loongson.cn/

Binbin Zhou (4):
  thermal: loongson2: Trivial code style adjustment
  dt-bindings: thermal: loongson,ls2k-thermal: Add Loongson-2K0500
    compaible
  dt-bindings: thermal: loongson,ls2k-thermal: Fix incorrect compatible
    definition
  thermal: loongson2: Add Loongson-2K2000 support

 .../thermal/loongson,ls2k-thermal.yaml        |  24 +++-
 drivers/thermal/loongson2_thermal.c           | 111 +++++++++++-------
 2 files changed, 93 insertions(+), 42 deletions(-)

-- 
2.43.0

