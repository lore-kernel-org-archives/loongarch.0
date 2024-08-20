Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CDB18CC08
	for <loongarch@lists.linux.dev>; Tue, 20 Aug 2024 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724159964; cv=none; b=ERGZ9Aad2csMmAPJo/zPVDBD5vszfPGvlWCG2RJ5K/mUqgjgttOoH32nyQ2bJ5mthbxFMNHgoFXSrDtxqe8BlLrvp76XcecOl0ZH+0K2TR7jLnAj2n+0qlEnPxvNmLc/2se/D2dkDqg1fRgU5q3au7TPr96uLGdd7XFhm5MO2eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724159964; c=relaxed/simple;
	bh=0TjgbCHN1MnLYCG8DdbDuCE4zOOSeudu1n3OyJHONjo=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=CV+vUMmCqvIRFW0bAWLHjwekpAhQWhbgzDM/VXdHR57Vzyy8nFdRFR6JslWOlxyRaoJm7a3v2Hr1WZ1Gf9/MLXiiYmAgH6w98QpkAA3ssNyfFEvJ9/Mh8tmU+Se+lwobc4t1LbgkT1ZzJikvuHAp53R5W8HUkQgsMqiVPvK2l7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQerZyq1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQerZyq1"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d3c99c5d69so911419a91.1
        for <loongarch@lists.linux.dev>; Tue, 20 Aug 2024 06:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724159962; x=1724764762; darn=lists.linux.dev;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TjgbCHN1MnLYCG8DdbDuCE4zOOSeudu1n3OyJHONjo=;
        b=CQerZyq1KKNHqsOIvXJoDhrnAN7ZMU5+3KPRjbAlsaHFqesJlMFGPgIj+as+Ra+rx4
         R1I1MkXP8zu37VREsJTB61zdVu11+kEwKH2+pWhdkfiBHy8GvKD5UGwedjGGgK6GPdaj
         0a+XdQCPH9yIX5r95ZZVsAA6gM5FildNjD6RXNoqTwYtMHHquWXumwgN5pc/ET39L7Zo
         sc2Kckdy3lA5NUvg0b+4wptIWw5tzZ8kIAehWaDygBTrkMy3OCz45soPhP+9BDC7jq8R
         dUBXU3Qm29Ogp9+lX9jrUCV8hCGbHkIOY0ZMBPbmlHn2qBPQVvsT76c+8goync0dVpnv
         ND1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724159962; x=1724764762;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TjgbCHN1MnLYCG8DdbDuCE4zOOSeudu1n3OyJHONjo=;
        b=NyyY/NYEYQTMyO1+E1TpkVWy+FiUutfatFW/wcp86/umJmccxy8fLzyLLqGMoOHDAi
         mfo4nDVsitZ6dUetBKcfJHL/4If8eaiSfXD5yYqxrSdVStSHrsWk+w/SEAPPt+Uu6ES+
         Ug/PNjYpgrpE3H6ZdYQgAZAu6sLAETdvIbL0ughxjId9qY8XBOKUhCR9ztlX5+rOjnl6
         J5ihNl+liQMI32DBtR7hNwmrkKvQACwM+1Lf+Lu9QAT7T7R6SIpp3R7oT1zDhX4Jnh8a
         7zQkXX2asWx621vAXLgqFqnjF555GcHgpQaYkJkp/wN7SsIV1ENoiATLPUi3GyBJJ+2/
         TNRw==
X-Forwarded-Encrypted: i=1; AJvYcCX3HgjR/UMqi92hlq+VlSAZWG5nPEG3NBqyGIm05PqVsrlvH2w5A7ekihpn8lzfLvLuSkeYJt8sgfo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx71hXOQmQN2Ge8Z9qeJb4Fm6IbOcV1ebII1nXpcT+Oz6IZwpSd
	WqzCsMHWNL+7sW+A8hkXB7uWceEsk4mHuKQ8WHIx/KBkbeZtywWxbb8l9cwUOSgf/Q==
X-Google-Smtp-Source: AGHT+IHIu8WdPeUDBAB3WDWBCManYJEhF6WJB1Icw1qZywYi86/Wscy1r3topHHOjPPeRuCqm3bITA==
X-Received: by 2002:a17:90b:146:b0:2c8:4623:66cd with SMTP id 98e67ed59e1d1-2d3e1a42e70mr9290342a91.1.1724159961737;
        Tue, 20 Aug 2024 06:19:21 -0700 (PDT)
Received: from smtpclient.apple (va133-130-115-230-f.a04e.g.tyo1.static.cnode.io. [2400:8500:1301:747:a133:130:115:230f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e2e6b3ccsm9414706a91.20.2024.08.20.06.19.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 06:19:21 -0700 (PDT)
From: Miao Wang <shankerwangmiao@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: It is correct to introduce new sys calls to stable versions?
Message-Id: <DF762B6F-360A-4C0C-8C85-55686417209B@gmail.com>
Date: Tue, 20 Aug 2024 21:19:04 +0800
Cc: Xi Ruoyao <xry111@xry111.site>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Sasha Levin <sashal@kernel.org>,
 stable@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>,
 linux-api@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3776.700.51)

Hi, Greg

I saw you have included commit 7697a0fe0154 ("LoongArch: Define
__ARCH_WANT_NEW_STAT in unistd.h") in your stable trees, which
actually introduced new sys calls newfstatat and fstat to Loongarch.

I wonder if it is correct to add new syscalls, which actually changes
the kernel features, in stable releases, as it might confuse downstream
developers because they may assume the existence of a certain feature
after a certain version.

Cheers,

Miao Wang
