Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1514A614
	for <loongarch@lists.linux.dev>; Wed, 26 Jun 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414151; cv=none; b=NzqvRI0uYuuUfCMz3YcnGkZnAOS5aftzVWOUomDkyPZdRyley456Y9eq8gJX2r/uwVN4tdzlk7TD58T4aIi4BKHYFyBezaTreXqPS7AM9wdldFm9CKsY7QvUI+ihlKHAVEniQtt6evIsw+kOdiw9MUSwunP4COLNYBMngZSeSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414151; c=relaxed/simple;
	bh=IgNBlbOpf1DxNT0twqhMkos/RJG5o9tckGzN741UmLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkkQ5WXlDMnWqCK5I4Rhtq3c4cMRy3zuSkJXd/kUwajS/kaFSmRzuQ3kbbCih5JfMF9+uUcET4U6qHbp2NsywvCFnh/587/jO5ZVrea4RUedM+bEqBlcXj713M0TDFnVRD/qh08AVa4rn16XiSmYNIRuvZquIAqYq8RuIx0YziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=X1JhBXrX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="X1JhBXrX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f9c6f2e45bso3087335ad.0
        for <loongarch@lists.linux.dev>; Wed, 26 Jun 2024 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1719414148; x=1720018948; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtL2/RZ3d00iaa623m8Saevl3iucbD0YDNmUEjoIQNA=;
        b=X1JhBXrXcxMnQcsTxka55ssOh5GPfRmbxrRenZFGZx2EuSclIMQ5sS2GqJ3k28gEr7
         +8F5GhT0L/w741PYmhbGFDmOY54Eleul3DzRbK/BXtSN2pFEAj7koSpQ4rdJLUu0nGOQ
         Bj7Xz2Cgm7cWkS8DCq0UZHso/foCBy5WwMA07PbhzLO8LQ9IuNc562KPPAtzeXmxeQ4g
         0up3gv7z/J4j/ndtwrUxCZCZbAfBM1sWiOecM48KUzBJY7Zeavl4T2/Vcc8J4TkT/4LQ
         kVT9UbChpD4h2oBVPTp5h1zyF/Gp+k4BzFrUvyY7HXKyX/MOMu0x+eh1emvP/RoAjzpB
         EFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414148; x=1720018948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtL2/RZ3d00iaa623m8Saevl3iucbD0YDNmUEjoIQNA=;
        b=YOtTf75JbfLLn5s/3g/sO5HqXF56mU3Fz8mw0QDdk9uX/z6oU+Hy92vFLZ6gWNkX9G
         atBoPH0p2JjblC0wFOTpb29dQjSvJrulp4XjzJEsTCLeLuj7Yo8mjacj6B/AKnyQDdrp
         L0cBV/ivlqki+6HJm0M50+BASR7Xyjz2MXo1PsTSQQ1TCZPuw9NmoFLoApCx48rLDE/t
         x3f7Z+ZD6A8oB+GDed8HzLBqvaXzQBOdwQ1jPv98ixb6qKBu0wSMnAm38TcvBCIGvXTT
         ag3wVUolfpzsMOaddgV0fietVlN97QC8T0NxAVKlLentK2Q4nAMeNBoj0AUHsqVeV356
         xH5g==
X-Forwarded-Encrypted: i=1; AJvYcCVubaSOLaEol+Rhz9cVivophGXVedgDkj/Hz9h1QVxOaU6ZyKK05GJH83BTVwKle2WVpGFq3xiiZIedKO2CqfQ+1iG46CAHZiOf
X-Gm-Message-State: AOJu0YyI3vVZ0qYyl3zCyppcK3ppk/WfHdgUJhDnL2y4mBC4E9nMHM2f
	eL+AWMtboalQ5I1XIevHEp8w1+R/VRLLHlXSj3QOfDFhhX/XcarArE9MDGpQElQ=
X-Google-Smtp-Source: AGHT+IES7/6m+LnbNG2Wez/0xukcHO3azrcRyMBPgOedLXHcq7TetakMG8dgyHzp5CKg6I5TQ+b1+Q==
X-Received: by 2002:a17:903:94:b0:1fa:1a7c:9a05 with SMTP id d9443c01a7336-1fa1a7c9d36mr124122535ad.6.1719414148374;
        Wed, 26 Jun 2024 08:02:28 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb32b9edsm100519705ad.118.2024.06.26.08.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 08:02:27 -0700 (PDT)
Message-ID: <0e2da871-7e28-4660-a9d4-4fbf6bfe24cd@kernel.dk>
Date: Wed, 26 Jun 2024 09:02:26 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Mateusz Guzik <mjguzik@gmail.com>, Xi Ruoyao <xry111@xry111.site>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, torvalds@linux-foundation.org,
 loongarch@lists.linux.dev
References: <20240625151807.620812-1-mjguzik@gmail.com>
 <0763d386dfd0d4b4a28744bac744b5e823144f0b.camel@xry111.site>
 <CAGudoHH4LORQUXp18s8CPPLHQMi=qG9aHsCXTp2cXuT6J9PK6A@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAGudoHH4LORQUXp18s8CPPLHQMi=qG9aHsCXTp2cXuT6J9PK6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/24 7:39 AM, Mateusz Guzik wrote:
> I am going to fix this up and write a io_uring testcase, then submit a
> v4. Maybe today or tomorrow.

Sounds good, on both incremental and test case. I can just stage it
separately in a branch with Christian's branch pulled in.

Thanks!

-- 
Jens Axboe

