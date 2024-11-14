Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F1126C03
	for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731604914; cv=none; b=mggw3ZW/uH2n+jaaNWyGDmX2c1s4B7gMS0zXnqBoixxg2ag6trYnN4KrqKWjUnl3mQZnQcaZw9oK0Gknu5ZkiO840tnjBt0ue6FWt52s/84zUv2Ru+3QJ0kCQk714Q3enARl6p6r92xj7KdSD7bwyqNh2k2Y1De2OQUawTYnJy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731604914; c=relaxed/simple;
	bh=ooLd2KnZY+iAsvZpcBbhlZVOlUE4xC2qvGpPzxWgCOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWdMLSyQ//Dn8e4489XR7mbkdsmda2g6oyvzF/K4mpihQefO7xyb7cNyLIvjOGM6Q0n4SLCCU0UJuHBVzqBI3OoORZmqlwHzQ3C08s8vHM31Z+m9nWyAm9WqgPtXW2MfA00X/ksuiShPmNLjOqPEco6A7ERc9QE+XdpwEmyzlVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ffpL0IRZ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ffpL0IRZ"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso12897601fa.1
        for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 09:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1731604910; x=1732209710; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6hn1K0JlF2yxtKRDiqqXBoVLBpc9QBlyQWe6RfRYuPk=;
        b=ffpL0IRZokY/bdYzRgAVln/8Z++d9LVuhSecYbhDp+1qq0PvWr6NcmIRbHOVUUYWEz
         6WD8umlw2h4i5h9DeYqecm+6sRDKeUWs7/rjmfDzO0rc7iu9+14XxReeOd5n7NwZpHtl
         k/GGduXpjtNH6C9MbQxEkt5QriccnbQ125lLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731604910; x=1732209710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hn1K0JlF2yxtKRDiqqXBoVLBpc9QBlyQWe6RfRYuPk=;
        b=YHKMAYafxQdPRKpnjq+3V5VpMe+DjQsIWAOlHyct2SRUGySZKvoJFY9dg791cias6U
         mD6uGNmMa13Ek/Ha4lFs67rIPTEM7dNQV+ECmdnzSZLxxhU3gsukJYoBU2JUoEHyluew
         ZaOmQ2sZ+ZjnU0Y9hO9ohdRYmLdP01gGSsazAjY1jrBPnIDlOxU7+JJJr4fhDpqrGSE2
         mDooV2qgkE3r02k+lns4EpIqRYVgKk4eqpD3K9+GMwjTZErA3NYwgjPFNleXrYda0y8p
         057f1g6lOX28kpws23dpqeW2OZwGSu8iLkdP3yYohL1VcX/IbeQ4WvP0qtboofJcH0F0
         o2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCX9QcQF4wATe43uThUMmRe6w3fVNM4xzJfH6ScGAV9zwth0htqjR7IhYFs1BDQraq7OJ9yYuK4octw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBc86qojR5KzbVxWc18iMLVsLRMzUQrQSxMpjgyBtWMMzo/yYn
	44IH7Tw+kCYqwgyAW7tAigXKUrhYsUdf2odNtdJLCgsebxpCdDB74TrJk+P9V1haslCaFFvLfgt
	DuBI=
X-Google-Smtp-Source: AGHT+IHnsbbkycZeBzcD1rErT/oi0AdrvmbJw189aS3Z+A4qrDNGZv4zE+VFzACQOC5tRlR82RH+gQ==
X-Received: by 2002:a05:651c:88c:b0:2fb:3960:9671 with SMTP id 38308e7fff4ca-2ff59027f10mr23346201fa.15.1731604909658;
        Thu, 14 Nov 2024 09:21:49 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff5a74d72csm2127231fa.70.2024.11.14.09.21.47
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 09:21:48 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53da353eb2eso1635553e87.3
        for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 09:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9SBIZlVhDG5rDriHw+3b1Y+LSBbwRU8SgU6mD5pKaxeueza0dwYN6AH/FuIq1UBQJparU0pcQPVA=@lists.linux.dev
X-Received: by 2002:a05:6512:224e:b0:53d:a504:9334 with SMTP id
 2adb3069b0e04-53da5c7b565mr2490631e87.44.1731604907586; Thu, 14 Nov 2024
 09:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241113124857.1959435-1-chenhuacai@loongson.cn>
 <CAADWXX9-LY7aaMax6KdtDV+vOkm_WKE76Qmy4n3UHN61O=-2Lg@mail.gmail.com> <CAAhV-H6=_Nv0N-zXNad2TgOzTgG_BU6TPhN+U4u=+SMQ98BPJw@mail.gmail.com>
In-Reply-To: <CAAhV-H6=_Nv0N-zXNad2TgOzTgG_BU6TPhN+U4u=+SMQ98BPJw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Nov 2024 09:21:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgC===Qx3STDjBWGHuzJ0SNP16gEz3iSc6Ebo_bM-yZtw@mail.gmail.com>
Message-ID: <CAHk-=wgC===Qx3STDjBWGHuzJ0SNP16gEz3iSc6Ebo_bM-yZtw@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch fixes for v6.12-final
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Nov 2024 at 22:23, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Maybe the root cause is that "From" in my patch is loongson.cn but I
> use kernel.org's SMTP server?

Ahh, yes, I didn't even notice that you went through mail.kernel.org,
I only noticed that loongson.cn did SPF but not DKIM.

Yeah, if loongson had had DKIM and DMARC set up to match, it would
have been an even noisier failure about DKIM actively failing, rather
than not having DKIM at all.

If you use mail.kernel.org, using a "From:" with a kernel.org address
too to get the full email verification is likely the best option.

That said, I went back and looked, and you've clearly been using this
mail.kernel.org + loongson.cn model for a long time, and it hasn't
been problematic. So your pull request being marked as spam might have
been just a one-off.

           Linus
