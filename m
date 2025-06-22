Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4A919CC3E
	for <loongarch@lists.linux.dev>; Sun, 22 Jun 2025 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750590242; cv=none; b=FHwmefMAqcMwHcwRSOCgks5Zf4JtOh53Cf3GxjtGAYaVhi8Pft6sM3Nd+16D+HL58369L4/bD0rZokS+5Dpcn3L85Qj1pWx7u4c5TniSN2LzI0dNcBwzcrSCNKtUlM/zGF3bcvYwH64ptGaRBeidwhBq7pRo4t67fR54lHs1wG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750590242; c=relaxed/simple;
	bh=Qc+kl+BZULne/++22l7jmMT41bJToxl4RbYBXn5+pWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJtvg9xzSFTAEJFenXl8j9FqLhkIVPlg2acqWMjiKmPw+XUd8+Lqs2kG4AItU75NPpg2DCYJZ4IhJ9+A4ywPnA2mEivqpcDED2tLf4q53DgZf7MRCl7+zBnjMw8SPVypqOdOAfoSmm806/yMmmKIFEHT4+CPvtKUTOBUCK9sm7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.149])
	by gateway (Coremail) with SMTP id _____8AxHHKt4ldo7B0bAQ--.61249S3;
	Sun, 22 Jun 2025 19:02:05 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.149])
	by front1 (Coremail) with SMTP id qMiowMAxjhum4ldoBa0lAQ--.33504S2;
	Sun, 22 Jun 2025 19:02:03 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	ziyao@disroot.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH for 6.1/6.6] platform/loongarch: laptop: Fix build error due to backport
Date: Sun, 22 Jun 2025 19:01:48 +0800
Message-ID: <20250622110148.3108758-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxjhum4ldoBa0lAQ--.33504S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr4DtFyrZF1UWFyfWFWDKFX_yoW8JFWkp3
	9rC34UArWUGrs2qa1Dt348ur45Za43A3y2vay7A34q9asxX34j9r1Utas8GF12qay8Ar1Y
	qF95G3W5uF45uwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcTKZDUUUU

In 6.1/6.6 there is no BACKLIGHT_POWER_ON definition so a build error
occurs due to recently backport:

  CC      drivers/platform/loongarch/loongson-laptop.o
drivers/platform/loongarch/loongson-laptop.c: In function 'laptop_backlight_register':
drivers/platform/loongarch/loongson-laptop.c:428:23: error: 'BACKLIGHT_POWER_ON' undeclared (first use in this function)
  428 |         props.power = BACKLIGHT_POWER_ON;
      |                       ^~~~~~~~~~~~~~~~~~

Use FB_BLANK_UNBLANK instead which has the same meaning.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/platform/loongarch/loongson-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 61b18ac206c9..5fcfa3a7970b 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -425,7 +425,7 @@ static int laptop_backlight_register(void)
 
 	props.max_brightness = status;
 	props.brightness = ec_get_brightness();
-	props.power = BACKLIGHT_POWER_ON;
+	props.power = FB_BLANK_UNBLANK;
 	props.type = BACKLIGHT_PLATFORM;
 
 	backlight_device_register("loongson_laptop",
-- 
2.47.1

