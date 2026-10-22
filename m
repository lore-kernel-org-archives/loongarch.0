Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792631163;
	b=aXVKF4vbEs/qM2fSCb2MMe6zbpyvjEObMcUSv8I2c33bCyc6TgOZZBPgeD7xTgFcBoOD
	 3IzFR2fkqBTDbOogu0IAAgQT+VeFx2TPRXYRbmBKG8cYRu0xeJ3tzLuil71sNhzv5ydCS
	 gR98kJX7nnRazPeF3Wgo5SwF6gG4lVBogTgwkDsLTYyPWpoL5DxaKagfh14ozN59C++vi
	 g0mJcw87y2hyUUOLk0uvSgzYQwyV4Mot2ea8wQlUsW55y2at3jruzbFjq9GInQ2p/ZKu3
	 g54yoB9M4Qhfp8bUZkgV9HW2C+g5ItsZ26dI2e+9uLpnbxoR5Pah2Z5wSGKPCEbLLHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792631163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=ePiPcahvlPcgRbrY0jN76MDwThUW/+ROusLduQZoNhY=;
	b=QiZvex6j0Hoh98NR6TxVKUBXrSjuWkSvhBZGPgCS/b8P+5EtHCNJo2NTWRGw0djGWzOd
	 Qeux4C9oHnU9glQVgWXC7+lEQusyn8CmYv0OXBsgV583Sbit0+obtyhawuPFCutM0zuIU
	 fZW/AswVtO43mS0OffSt5s/Gom/hmF2kPI2tKwfP4IEaT1WR68CFDRVQ/mTrj1bbe6JbJ
	 +rUa56PvnmBB76uBeRrGnOaKdFWfZW03MS9miI6FI21eUPo+CM93p46SLE9PEKwk/jQG8
	 MgkGwD8Z+6FcwN+cizAwIynTyvv0fdqHj61ilsnF1+9ZvjizZvfA5Xz3Z9wsbWRuo6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ttit0zHK;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089B1606A319
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 01:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089B1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ttit0zHK
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so2887437eec.0
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 18:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792631162; x=1793235962; darn=lists.linux.dev;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePiPcahvlPcgRbrY0jN76MDwThUW/+ROusLduQZoNhY=;
        b=Ttit0zHKShml0ZAOi0T5FoCKduTXw7pmuzQDQxM/j6EzUzRQuZV85X1+bNz3/O5lao
         e+hIJ8JFlLIC8PPY3FV+HOZQoDkbcN2jNvl8s/EBXAece/tHjV61+YT2IO3bPz05sUvk
         DJDtoLIsHFEsum2Kz5/Rn++G3nCfTASm+n5KxuyOwwvNwRwdCur8MxdZNzCQM2I+rZeQ
         eckD1mMv6pMaHze+sbnJxme8ix5XkRnahtW4fSvxe7yu93+LX3TmW0IsIbhAThXb4ue+
         RyVPNYspZPonx8repmW7DJ+IzaDtFAOvfUAiumnyb9HFsZF/XqfbnFUCOyayH2pFaD9k
         Sjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792631162; x=1793235962;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePiPcahvlPcgRbrY0jN76MDwThUW/+ROusLduQZoNhY=;
        b=0p232JT6BsNY9gupbWzilVXHR3sSbtMfZ8vvrh5xmoWta1eTTKJ17gs0QqSqOxQ8DI
         SDBvXBIXiMl/UBLJnZRfqHamGrNuGfH+6Okj2DVRNu48X9jRdKzaey/Ggp2hwyO2FXTy
         PutrBfe2EkoMiV8LoBGIMJA67F199x0Wk2ZSTOA2euVVyWsM3/uwPWsT7Kf1Z7oXrAzd
         E6b1rfvAB7xoUvYsqZ3qg/3vxGMMACylrnvfySN2Dyc4riogg7FT2i0g8RQqM1C+auXu
         e4MtzHQb4PCk7JrALY8c4u5ih5qAH6t9SjAoUBLJofizWPgFLyaEwu5LIIBVtsT8kP+k
         SkLA==
X-Gm-Message-State: AFq9FYJ0hRrF/LmQwJ1uGOj1fUDwzen0aeE2QvhoEvxWs2KIIAtX+2MY
	EJ5QEDcrALsQOMvnwaHSmVdhZIR1BfjPi8Oa+DdFcAcONUSZLQNP/34ZG0rv3Q==
X-Gm-Gg: AYBFou1nQzXjFGLUosNGeZgSUMw6rhjq5Es0BuND6yvPAzoXk1jqS2NO8RruSzZ8zDV
	CRxSkvEw1zXJJDRQR3PmSqgK4Qsq5wtfLaXDRRaHeURHNNJ44aebwfRtfvcPfxYZvvTIT2YHGoq
	GYGKUrFKEofHV/q7Fc9Tk8VYytsxY7GnRBy0NsxWVjEXnHmcAeag29916nMJZQX/dohldY5RTx7
	URd5APbBCTkI18PpXlbXUKfGYlN6/iQB6D+BaNxKwZCLmOnAMjrK2YnZmjdJk3gn/LT0C7jQfj7
	k+2psC7jxArlbsNPYxP/jPy+RVgCAZl+C6qIcXtMotfPvfvkID2fBbzsWr3XIeXAjX6q7dyEeBr
	MDjq5UkvCZqGuxykeTwfvrXsRIN/jaNn/bZ9fGdyUdYKCTZIJcxPBkkv0eFzao0jYu7ZmTAKT9i
	+P+oGWmEik/n2UGXvRkYwDBzE91NQ8Vgb1JgFIDD+QS1YlWxQDBMXiVR0sdNHwKKWug8qLZt2Qx
	Py4FdoChKm50lyGDyn3dJjRDcet+m1UwsrVd2MofdzMlc2M
X-Received: by 2002:a05:7300:c00e:10b0:35b:d329:9f3e with SMTP id 5a478bee46e88-3674e842a86mr5865269eec.28.1792631161936;
        Wed, 21 Oct 2026 18:06:01 -0700 (PDT)
Received: from wg-vpn-sf2 ([138.197.218.192])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198fb21sm11168982eec.23.2026.10.21.18.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:06:01 -0700 (PDT)
From: Vincent Li <vincent.mc.li@gmail.com>
X-Google-Original-From: Vincent Li <root@gmail.com>
Date: Thu, 22 Oct 2026 01:06:00 +0000 (UTC)
To: soffialanotte <soffialanotte@proton.me>
cc: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Subject: Re: How can I get started with loongson?
In-Reply-To: <nIF7OzD8u33FHJ3qE1qFaK7jIfY6eOxk3R7imk_36Akc-o0DTFbXgpOe0Svpcw0Mi_Usx8t_WXLc8j3VjwJCVbLeXmCba5YxdiNsk7dkHWI=@proton.me>
Message-ID: <238b4f71-81ed-81b5-1bf0-5ad5773b5846@gmail.com>
References: <nIF7OzD8u33FHJ3qE1qFaK7jIfY6eOxk3R7imk_36Akc-o0DTFbXgpOe0Svpcw0Mi_Usx8t_WXLc8j3VjwJCVbLeXmCba5YxdiNsk7dkHWI=@proton.me>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1941501259-1792631161=:1724185"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1941501259-1792631161=:1724185
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Wed, 21 Oct 2026, soffialanotte wrote:

> Hi, everyone.
>
> This is a quick question. It may be inappropriate, and apologies
> for remaining anonymous.
>
> I just became an employee of the loongson for a while. My business
> unit is not related to upstream Linux directly. Before joining the
> company, I had been a Linux amateur who contributed to the upstream
> for other platforms. Since I can access to the loongson hardwares
> easily now, may I ask how can I get started with loongson upstream?
> Open documents, schematic diagrams, datasheets, web pages accessbile
> only internally, etc. All of them are welcome.
>
> With best regards,
> An anonymous
>
Hi "An anonymous",

Welcome aboard (to Loongson and to the list)! Great to hear you've 
contributed upstream before — that experience will serve you well here.

On getting started: the usual paths apply — watch the list for patches 
touching LoongArch, grab a board, try booting mainline on it, and fix 
whatever breaks. For docs and schematics, the internal channels are the 
right place to ask; folks on this list can point you to the public ones 
(kernel docs, the LoongArch wiki, device tree bindings) but the 
internal-only material has to go through your company's own process. That 
part is a conversation for your BU, not this list.

One small thing, though — and I say this with a smile: Linux upstream has 
a strict "no anonymous contributors" policy. The Signed-off-by: tag is a 
legal statement (see Documentation/process/submitting-patches.rst), and it 
requires a real name and a real email. So if you want to contribute to 
upstream — and we hope you do — you'll need to introduce yourself 
properly, both here and in your patches. Anonymity is fine for asking 
questions on some forums, but it doesn't survive contact with git 
send-email.

Looking forward to seeing your first patch (with a real name attached!).

Best regards,
Vincent
--8323329-1941501259-1792631161=:1724185--
