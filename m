Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667E1B86EF
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083504; cv=none; b=h6XMpki3U05RTtdFApA4msH+6tZbCBHEAvgmSsicvddjV6079H/YKkzgAyMrbBtUotlrE2mTakbcOtNsfC9hWVOzsOkekHHT1xcnfpTvGBtzJB6st2m7J67+TScuvz7krSeG2y4tK8dlip5iv5LUIgkoCW3EOLjBthM/BEo/Ztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083504; c=relaxed/simple;
	bh=1+RF3Q0uf3HfOFCtFtYlx/BxwW2WAsKStLomY+0oYLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqiQDvjvROQu6jpYhZZUcSPit1K/0Q64A1ydHAXJffjvqjsortgaSQ9dvd48j56nSFbU+5FtmIdfXD0ORC7wPefAy9T9O3Me50XWyG6gazNbzSxCOj30JqZ9zxhnqT7WY90DntaCWHIjFd7GUFmlY8erUGsYd9wIR3Czs3XnqBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+vFMmh5; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+vFMmh5"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d88cb85987so53746466d6.1
        for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 08:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738083502; x=1738688302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+RF3Q0uf3HfOFCtFtYlx/BxwW2WAsKStLomY+0oYLg=;
        b=d+vFMmh5KdgyoDbilR+vxkx+7Az7wA2LiQUDOibnNSgRJ1pSusNfvWktl5HYdir1nl
         000XUB8ZqRBFZdtJrtsBOMTdet7CWeW3D/g6uqJh7zyYtQVK5pNIgeS0LN993Ne+8mOG
         /1CDjM4XKtQ38fmdblibyLAiY0Vxqjq1tVia1kYRlq+iteg1e5zUFFjsdZH2OE4RcKpM
         qJaEIFLB1pulD+tcN6p3dwDsGUbegL2clJc1AimxUsulofudmUgpCl9d9ngvZiyjDCOX
         +rxa4ZykUOwOZ+MsvYzMWEybzrU3uEKI68j/rx016/i904ual+JJ2vijz27cNeJ/hyP/
         isZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738083502; x=1738688302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+RF3Q0uf3HfOFCtFtYlx/BxwW2WAsKStLomY+0oYLg=;
        b=dPIrEKUEbXIx3FdsuSM4wrOWnR38c2NfRgy2kxETZq8CZcD3E0X1vwqhihLi39v7Yx
         KRFB17NQr288J3ssL/F1H9CtiDg0u8snhkgcv+Gm2YTE103ii/Pva/7h6C8irApwh18y
         zBVsRONdPAJOtytM7ZfCFXBRo9WY3hC5L+Wjnt1Fa7PESLL7/F0uKf1hzotxJZLewHsk
         4fT8rBsPpAVdAUG7Ob9ugIqpsIQFBITLBQr/W0vZDOYwxZNI/sh/X15Xp67Vri/pXrMc
         Cfu5dSik+IK8gsL7HAYl10rth9Z7N4T/2FK4WlgmIwrAD+stU4PVhJJMT1PeP4Wh7slu
         U5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+w5zSGk9GLVMDA5gwa+SSMyf+L4FmEf0I0Nle7XRzUa6ojcUyioufFIbCNlmQ4xH09hpyWT4Wsj8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp6RMYm5wXQIWyE4SDRZ3cXpaOEiYnK6lAUS/leEjh/mYEe1WZ
	i7jvVFzQvxsRjfx7Q+nxvOcVRh+1s4wJX2iWHNChlvniXIZvPGTY3OC1CMPmPPSt4KuqwCnBH3/
	7Wb5C2yo8ahu4X3n4ebzP5zRxkwk=
X-Gm-Gg: ASbGncs7FZaRxL8z03oz93qOTv5yQS294Vu6emAjYtBqyr7lyC0m/ivZppBDelx1ZYg
	CyoB+on+5aZ/2Qia37MR2yFB/s0c/Z/oPfkSLMMa6IorB8+qCyCeo4J9+VOID74bMGB++0YrB4d
	moH4RKv6Fz6Up9B5MIBrFO3ny5DHEC
X-Google-Smtp-Source: AGHT+IFUB+GYI2wbrBow8j1cwgALwPi6OaP2vZx3QC/pRKn8BXSD4q0WE+JwoT8IGIE0YMqf/sBx7sphVJEtpjBTLJQ=
X-Received: by 2002:a05:6214:5241:b0:6df:ba9b:35ba with SMTP id
 6a1803df08f44-6e236701e98mr68917576d6.12.1738083501955; Tue, 28 Jan 2025
 08:58:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z5gdpStVzlM_fRLT@google.com>
In-Reply-To: <Z5gdpStVzlM_fRLT@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 28 Jan 2025 08:58:10 -0800
X-Gm-Features: AWEUYZlIl_QJ83hgaih8iJvjXYE99i1pU-y6kFHG4O2wfAUwwla14NfZglLKKeI
Message-ID: <CAKEwX=P6sOFyY4UGmuBKH3Ux-tP5tuCjEF+EUVEnO3ReEC6etw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: z3fold: remove z3fold
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 3:58=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> Z3fold has been marked as deprecated for 2 cycles and no one complained,
> as expected. As there are no known users, remove the code now.
>
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Thanks, Yosry!
Acked-by: Nhat Pham <nphamcs@gmail.com>
