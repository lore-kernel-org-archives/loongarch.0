Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47938FA3
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756694865; cv=none; b=s6Ryal+SxH1vQ4DAe6LhvqKYc94geH7Hmy1s0g/AKcWAPx0SzLPi9S/u24/VkYX5JiaZ6XUvEZdmfnkeRTfsBmCSyVXOx7awPgRDM/nYVueYhT/mgZdnQngjvDcqjeA3QENx3STIEzj55qv0bVTT3XMq6RmlhsFSWVk93Eh6ZC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756694865; c=relaxed/simple;
	bh=rxZr/LcE7mUoqfWVuzgUn17kyp83T4elClPnRt0j/t0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=msjh/xxeawDDUchIpmjZtS/hpJ6hkOZc05quQ9PUFBNO0mYb7DThekMXkdELvqx5oXG6HcnS+CO7OH1Twx4ce3qy67ksLiKGCKHMC72tWeHaUCkOi2XiHCEAkDyD6976IxivvYVVLdpqINn/0W43VXXV/Lr7QrytPjuBFn2f53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhSxPEfi; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhSxPEfi"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b30f73ca2cso29066971cf.0
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756694863; x=1757299663; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oZYiCjncPBOCZL5vVyQngckkkRakO4ayJSf8550Lyuw=;
        b=mhSxPEfi4Sr+yQxPppYm1681C//1TSOrmsFgbVW7h8S2yhF7WgpL0Z2cqrQyM+cUe/
         5mCMICEHsBqLHrckYwgP4k9v0eqsOEudYrdp4hUE+3oKY8onT5FtpmV+MFaEq2Z1ZITr
         xOapV9wtRLMZcYz6aLavjHjjmCkDSO7E/K3xZ7vdtyz71qQ/w2F/Sj90p++I9oLIZsFX
         ErpA76X/m07SYpSFmL5FLiPRJ4QkcpSJnbA65Xu6PFW1jkIAr/dTfOdUjkIEojyra58a
         rfM/t52rH+xvGPNG6tqCyF3rpk0BphhNMeSBIQTLG22I8I3AT9f4dqtrBF4Sbfc8//JP
         KtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756694863; x=1757299663;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZYiCjncPBOCZL5vVyQngckkkRakO4ayJSf8550Lyuw=;
        b=ZQOdsDTCoHmCEDZzuC/TDz50ElZnUrAfDBsTKgkp7p5sgl8N+JFVx8kbvkVCexP2+R
         fdoKP0YoQDoq90qdBywcgNha4S5H05NYeRKd+eyaDq7Z3TWVhHI9cyb6LaIjQD1MIHnu
         NOUK0AKjkApXjAC5F64Hl36uTSSVtge7ceAQY3m66ZzKYl6yUo2xkx4Urc5n667tlYpv
         RJp5Chz2fpHHjH9UCMoMuMjG8bgTZk093WYbcUMN/OJC9BzxyF+4vqv2E/8QAgsV5kDv
         F+QrX0dGlZBEDen/QoYqTp+EXutw+MlYVE2+lZJqjNOhVChqxAre1g/5jjCu5dZA3+0x
         TJZA==
X-Forwarded-Encrypted: i=1; AJvYcCVteXKOunTg9YoBxNKB0Rg2L4+7fCNCZNvIaMmbp4pBiF4BQl04DPLsGlVZ2Vbm9tIhHv3TbI6wjwA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6xuRXjNl6JMJG7oIHDPUX40byjXz3XFhQcqQSkvSILXPAK5fJ
	2YlrKO1jgoiQjoHrBlw9lamqqQNcoWoWrIVSIKrpqYBTQfOIen6yZBHy8spo9FwsP7e4FiW3I5g
	WFCxpvew5qq7ZrigUt88Vpg3bAfzMrns=
X-Gm-Gg: ASbGncu4a3s/iD2TYALCsO377qcceJyral5R9MyvXPlW6w2ZmzAXN2RSDuawaDSGLjb
	ja7xn7AexGI+6SfPRlyP0d9rg6KQWE/DzMiJUKCMwXwb78e0eZRB7WdPqGu+6D7kAOE8sZKqwhX
	t02aEk7puyt1b53RVWE96bM4rhcbBuUZ22A8kDy3cjUIGksBuuCQvkAroTe6kyuv/NmWuqk9QmT
	pGvf1eaUvMZaDN29w==
X-Google-Smtp-Source: AGHT+IHXzXAlKqknR7kubGUYqfXblADyqMfalPcwqRqHW29E6ncagvwr7bLO51jOlizKaUogiwo9dSOgT9qhm/58z2o=
X-Received: by 2002:ac8:7d51:0:b0:4b1:dd3:e3a0 with SMTP id
 d75a77b69052e-4b31dd23cf1mr74235981cf.63.1756694862825; Sun, 31 Aug 2025
 19:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 31 Aug 2025 19:47:30 -0700
X-Gm-Features: Ac12FXxAkBGzgJL6wXci8JirS0KlZnqs7A_RgrHcMn8mLb0FUKeEL18G77Af9kY
Message-ID: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
Subject: [BUG?] driver stmmac reports page_pool_release_retry() stalled pool
 shutdown every minute
To: netdev@vger.kernel.org, xdp-newbies@vger.kernel.org, 
	loongarch@lists.linux.dev
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I noticed once I attached a XDP program to a dwmac-loongson-pci
network device on a loongarch PC, the kernel logs stalled pool message
below every minute, it seems  not to affect network traffic though. it
does not seem to be architecture dependent, so I decided to report
this to netdev and XDP mailing list in case there is a bug in stmmac
related network device with XDP.

xdp-filter load green0

Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci
0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
Aug 31 19:19:07 loongfire kernel: [200872.810587]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200399 sec
Aug 31 19:20:07 loongfire kernel: [200933.226488]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200460 sec
Aug 31 19:21:08 loongfire kernel: [200993.642391]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200520 sec
Aug 31 19:22:08 loongfire kernel: [201054.058292]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200581 sec

Thanks!

Vincent
