Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC9E155733
	for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712742567; cv=none; b=FuhxYVO6BWIdgUV+j5y0nMZVoZAF/3dHqvTWTES9ClQeTaLVI851IDXVmncyYvHF7BOifwr8jFb9xR1i29ORLtRS99lcnkVNzyqNrK0nnEh/NtjRVF/qjl7xD/RlgC59D7EIq4Jv5EuiKOQvmGe9yprPDWvjhmo/t71G9axEEn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712742567; c=relaxed/simple;
	bh=NooABAJJvob9ag+Jl18WHSFxgZjpmUjgfLwNCOukDXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QxRVzFoRZffIyTKkM9EnAURb8LnM3IJbNwozYNMUPQDCE02HrkXM2d5Z54sZrWW1PGZ5EOMOG4lwsZ90s6e1rEflI7z9pIMKsHO4eKCBwkBFVQjW1gsJfuimv20VBz+MreOpnCJarSVqZe6IsEA7tlI9+GPem+tVlGaafwy8GqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8CxbeubYBZmBS8lAA--.19876S3;
	Wed, 10 Apr 2024 17:49:15 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxSRKZYBZmXlV3AA--.21925S2;
	Wed, 10 Apr 2024 17:49:14 +0800 (CST)
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
Subject: [PATCH 0/4] thermal: loongson2: Add Loongson-2K0500 and Loongson-2K2000 thermal support
Date: Wed, 10 Apr 2024 17:48:59 +0800
Message-ID: <cover.1712733065.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxSRKZYBZmXlV3AA--.21925S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XryDtw17tF1rXFy3Zry5Awc_yoWftFXEkF
	ySga48Jw17CF13tFy7Wr4xG3sxWFWq9345CFW8try7W340yFyDXrWDur9xWa1fXrs8uF15
	X3ykGr1xAw1xWosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14
	v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU4jXH
	DUUUU

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

Binbin Zhou (4):
  thermal: loongson2: Trivial code style adjustment
  dt-bindings: thermal: loongson,ls2k-thermal: Add Loongson-2K0500
    compaible
  dt-bindings: thermal: loongson,ls2k-thermal: Fix incorrect compatible
    definition
  thermal: loongson2: Add Loongson-2K2000 support

 .../thermal/loongson,ls2k-thermal.yaml        |  23 +++-
 drivers/thermal/loongson2_thermal.c           | 111 +++++++++++-------
 2 files changed, 92 insertions(+), 42 deletions(-)

-- 
2.43.0

