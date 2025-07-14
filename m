Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CCB21C174
	for <loongarch@lists.linux.dev>; Mon, 14 Jul 2025 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752473461; cv=none; b=Lmc/Q4jsOkI2WOsiam8MHfNWizYmfv44NFvq9t44Y3dRo6xAdsNnIVxJAMYZbjFMvQg3MEJ5fiRBrV5oQMpqEOQ+KKlsleQHjlArysZ5iU6+h1PrY/N/v+sJ8mwvsuGU37Z/9FTUINaCuX7LK+lwJON0HOlBKAdPGS3FgzfrjlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752473461; c=relaxed/simple;
	bh=e/rH8SD+Tg5pje3Lq+JRo3ekvTZcKBI1NyNIj2hZ318=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kkIBIxU8eJUf1gOKeSUYTEspBM36T8EUT+SWlTcOLWILT7IJqmNCU9zWP94SUShBogwMw9FVlicNRdauEwXhnDe5MXyapoiYI2/Q4CcjIao3isozcqSX7R8JNJe5LkxEhsLL3YqShjIlSUk+/S5zjhcs0fVHvdXQGILjB5UmAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1SReUtF9; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1SReUtF9"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-454dee17a91so29166205e9.3
        for <loongarch@lists.linux.dev>; Sun, 13 Jul 2025 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473458; x=1753078258; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=1SReUtF9i05eT8dxRswJF9jtf5LvBA8a6KR0rf0Xp+J5mu76RqjjyMQKHQAzEapl/q
         nMmNKGBLo2uF3NCJtvT/qUMtPAJPUw37aZiHHwUKZN5Fyvwgl6Z6aIw6wJqxvMQgW6Cs
         B/Npx8weSPjqzhGykkbizZtgLwAmYiGkkzJM/kByri2C+nhA7BHPZTm61Ac5cah7jsjW
         PiE3uH8hQ+yyggvrXzCbxHZtRTi+C6Axj1keV2WrrGDHskRrY4Pnf38nStaqCIxLfx45
         5k5UO74LTNflpEWDYAtZH8Ru4tZ6gbnOA/f/+rQbh11/3K4LIqUFyWdoUUY/tAWgxnYJ
         WfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473458; x=1753078258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=Ua3Din3IgCczD1vvrWY6WPEQ6fIDxGkQHFVNqSnIuwZ8iyuebkc1egey7Yw4GxJfM9
         TPPqqLBnLcc6y46QJnzUcSesXrCUwb+vxCCGWxVkOFSzqhpsiN4vH2piotGDFgySunrr
         zWrQsiEF9tsoI91VKi537+wUXCF1AOcrPXzHCTlPFD5I5kXHCcLaE8OvY0V7wdGfQXPH
         v6crqn7T5HMLqB2o3T2W4NONFLGE6EwhYcg4e4Ps9LZ/QIFW5ks7J2fe/HwSSbqDxILf
         R3Nq698M1UoHkjr2ukx34YZjPcemqwMYz7YIeKm4hq4ke+rE30IV8ng4rPGu9CJAwDLJ
         W74Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfmUmW5LgdDGZ0zt+J7wXK9mG0Hx2B4jJF3gxOgy0PYptMa8RML90fAnL234NXQ+o3ioumFpFmL+8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKIrjckN21Yn2Q/3lRbBkFSe4ifjRrDT7XXGnX+WjTJfMb0iVU
	Ikj5nuSKDY0DAEz2lvz+mp4xz3r5b9X1MuU8KTopG8pmP0jvR+H9zaggr8Y7VUFIkWggS/6aHA=
	=
X-Google-Smtp-Source: AGHT+IFULlVjyNemOnSbG4TdMozAA0zsJZsF8hZ5FwjjrDDzQ4zhxHet1bEj5zD9JLh9WJDb+7sgf2zL
X-Received: from wmbel18.prod.google.com ([2002:a05:600c:3e12:b0:456:1194:a7e7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358f:b0:456:7cf:527a
 with SMTP id 5b1f17b1804b1-45607cf57cbmr50279335e9.28.1752473458182; Sun, 13
 Jul 2025 23:10:58 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:45 +0200
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4119; i=ardb@kernel.org;
 h=from:subject; bh=1185/TpkpWg9isRLFf5wyjQebHCYqV40b1OjCDnfhjU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3pfgGfFHvMs1rzs+7g2Z3jR3vmPyZLljMXN3nZu4o
 j/3A2d6RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhI9XmGf+YT5LnE2xivqL3c
 nC3HM8NQY4PQY8/mbbM+RMQ4nbzY8JqRYeV6Hz0bozMrpnLtY7c4Y8N90k7s2BaRs7se9l/3u/z 3DAMA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-6-ardb+git@google.com>
Subject: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The EFI rtc driver is used by non-x86 architectures only, and exposes
the get/set wakeup time functionality provided by the underlying
platform. This is usually broken on most platforms, and not widely used
to begin with [if at all], so let's just remove it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/rtc/rtc-efi.c | 76 +-------------------
 1 file changed, 2 insertions(+), 74 deletions(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index fa8bf82df948..b4f44999ef0f 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -112,48 +112,6 @@ convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
 	return true;
 }
 
-static int efi_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	/*
-	 * As of EFI v1.10, this call always returns an unsupported status
-	 */
-	status = efi.get_wakeup_time((efi_bool_t *)&wkalrm->enabled,
-				     (efi_bool_t *)&wkalrm->pending, &eft);
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (!convert_from_efi_time(&eft, &wkalrm->time))
-		return -EIO;
-
-	return rtc_valid_tm(&wkalrm->time);
-}
-
-static int efi_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	convert_to_efi_time(&wkalrm->time, &eft);
-
-	/*
-	 * XXX Fixme:
-	 * As of EFI 0.92 with the firmware I have on my
-	 * machine this call does not seem to work quite
-	 * right
-	 *
-	 * As of v1.10, this call always returns an unsupported status
-	 */
-	status = efi.set_wakeup_time((efi_bool_t)wkalrm->enabled, &eft);
-
-	dev_warn(dev, "write status is %d\n", (int)status);
-
-	return status == EFI_SUCCESS ? 0 : -EINVAL;
-}
-
 static int efi_read_time(struct device *dev, struct rtc_time *tm)
 {
 	efi_status_t status;
@@ -188,17 +146,13 @@ static int efi_set_time(struct device *dev, struct rtc_time *tm)
 
 static int efi_procfs(struct device *dev, struct seq_file *seq)
 {
-	efi_time_t        eft, alm;
+	efi_time_t        eft;
 	efi_time_cap_t    cap;
-	efi_bool_t        enabled, pending;
-	struct rtc_device *rtc = dev_get_drvdata(dev);
 
 	memset(&eft, 0, sizeof(eft));
-	memset(&alm, 0, sizeof(alm));
 	memset(&cap, 0, sizeof(cap));
 
 	efi.get_time(&eft, &cap);
-	efi.get_wakeup_time(&enabled, &pending, &alm);
 
 	seq_printf(seq,
 		   "Time\t\t: %u:%u:%u.%09u\n"
@@ -214,26 +168,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 		/* XXX fixme: convert to string? */
 		seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
 
-	if (test_bit(RTC_FEATURE_ALARM, rtc->features)) {
-		seq_printf(seq,
-			   "Alarm Time\t: %u:%u:%u.%09u\n"
-			   "Alarm Date\t: %u-%u-%u\n"
-			   "Alarm Daylight\t: %u\n"
-			   "Enabled\t\t: %s\n"
-			   "Pending\t\t: %s\n",
-			   alm.hour, alm.minute, alm.second, alm.nanosecond,
-			   alm.year, alm.month, alm.day,
-			   alm.daylight,
-			   enabled == 1 ? "yes" : "no",
-			   pending == 1 ? "yes" : "no");
-
-		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
-			seq_puts(seq, "Timezone\t: unspecified\n");
-		else
-			/* XXX fixme: convert to string? */
-			seq_printf(seq, "Timezone\t: %u\n", alm.timezone);
-	}
-
 	/*
 	 * now prints the capabilities
 	 */
@@ -249,8 +183,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 static const struct rtc_class_ops efi_rtc_ops = {
 	.read_time	= efi_read_time,
 	.set_time	= efi_set_time,
-	.read_alarm	= efi_read_alarm,
-	.set_alarm	= efi_set_alarm,
 	.proc		= efi_procfs,
 };
 
@@ -271,11 +203,7 @@ static int __init efi_rtc_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, rtc);
 
 	rtc->ops = &efi_rtc_ops;
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
-	if (efi_rt_services_supported(EFI_RT_SUPPORTED_WAKEUP_SERVICES))
-		set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->features);
-	else
-		clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
 	device_init_wakeup(&dev->dev, true);
 
-- 
2.50.0.727.gbf7dc18ff4-goog

