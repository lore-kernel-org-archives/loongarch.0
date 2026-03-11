Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3915A2BEC5E
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211053; cv=none; b=DEcKD5Pl8XyxcGy2F5EEUQBx11FBXOcH0PFxnMMQgXA71GPZtmnMj0Pts6kE91AgJQTbkhegMhYoxL3ciBn4wt9m/ZgOg8310FVEAliSiQ6YqIiKOzUX7lFEZ9+zHdoAdoH04aWJZtflhkfCbpbi9jSn4+/Y5iGQ0OJj947M/aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211053; c=relaxed/simple;
	bh=qt0fOfNbq4Yu2DKVKmOyRZG8eyzInj50vaae7IuRQrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1MNTpk/0aZzs/4cFYp/lftNJRPO2WhvLDkZIPnTLIjVwJX3Ewi1akfy7KzqvrO3INzlQALg1rf9Pc6cxhuI8p6QGVGuPmmj4yowu4e1m627SU2v50K2kTdPR3rxk8YieKbC65eG3XYKe7yIEl7LPRlmJzWIeNqtqar2LFqJ2Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxisKqDbFpoNIZAA--.10006S3;
	Wed, 11 Mar 2026 14:37:30 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8KoDbFpqclSAA--.26805S3;
	Wed, 11 Mar 2026 14:37:29 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/6] MAINTAINERS: Add entry for Loongson ASoC driver
Date: Wed, 11 Mar 2026 14:37:16 +0800
Message-ID: <3d55a01253654adfcc99c0ab6d0460ab3de5689a.1773107475.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773107475.git.zhoubinbin@loongson.cn>
References: <cover.1773107475.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8KoDbFpqclSAA--.26805S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEDCGmxBEIAkgAAsH
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr4fJrWDWryktw4UKrW5XFc_yoW3AFg_u3
	Wag3yxWr18CFnrG3y8XFWfAryYqayfC3Wru3ZFqw13Za4jy34YyryDArnrGr15Wr4rCF4a
	qayxGw1xur1jqosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7TKZDUUUU

Add myself as maintainer of Loongson ASoC driver as I will be
responsible for this driver.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77fdfcb55f06..d58619de1c97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14936,6 +14936,13 @@ F:	arch/loongarch/
 F:	drivers/*/*loongarch*
 F:	drivers/cpufreq/loongson3_cpufreq.c
 
+LOONGSON AUDIO (ASoC) DRIVERS
+M:	Binbin Zhou <zhoubinbin@loongson.cn>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	sound/soc/loongson/loongson_*.c
+F:	sound/soc/loongson/loongson_*.h
+
 LOONGSON GPIO DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-gpio@vger.kernel.org
-- 
2.52.0

