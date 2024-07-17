Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA9BA4B
	for <loongarch@lists.linux.dev>; Wed, 17 Jul 2024 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721192918; cv=none; b=l7pVE9iT0xMoon6ACV0JPyYwAnmqRrS9vMblR8eFmKLGcBkYPQHEqqyo2lozMkpR6Ql99SVwBA0GNIrAgb8nHc2O32kAeVmUZWnQK34s5vThmfAIcLmx7y+wZ3YLjOP4BACMTBANlQfqY1I4MP3zcl/la4aYI+WKkU9RwFJPgJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721192918; c=relaxed/simple;
	bh=456vFjdQgX8t+DKO4cXNe0nbngfpEhmfIZpf1Fy7zRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu1TS4MVtK5h541+OV0BaPrCKbifk9ALUnC6Mp7oxpC/c7q2w7PBm2aFX1z6jgTnruAENA4gZB1RW4jNL68NLiFqC54h24L1vTjvid54DyV5CmALTeVvxel9N0KqUMG9KDzv+CJ+EoI+a7Ja27Y4LhfcqtM4UTcM5fZoNedPqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W3Zk8xc/; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W3Zk8xc/"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so89450021fa.2
        for <loongarch@lists.linux.dev>; Tue, 16 Jul 2024 22:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721192915; x=1721797715; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ylupikJo36krvlGvfFYUWfmmy7QZTRdDT6qxa+A7N0M=;
        b=W3Zk8xc/9l1kNgj42nceruq1w3pKGaDsqua2KpMp5xpsUmzO2g9afpKDuh/WSPL6Kq
         H52Rz+V538ez4AeOQ52l2vi05aKGL8pKQE31hPK9QaAfJRUV3sqG1VHNpSHp89fTWPfm
         2ooWUPT/B6ZsS66zOEvcbbAGwShoK6zS2+j3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721192915; x=1721797715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylupikJo36krvlGvfFYUWfmmy7QZTRdDT6qxa+A7N0M=;
        b=OM3xLKebAGaEGCwX8px6AioqSdMeHnGrJ+ajlMI+qsW7D6+goU/X0diJmaaiqBF0qy
         U9kMjlo41YXDcMKULwWWldsUJTaIlx71nM6k5r0LCNkcVIw1BA6VxqLxx5I/fC/fMIAf
         UOH2Hr8YD7MY8WRh4h+5VQRbPlZVTV8FsVsTBohCHpoOmhcgzmhYx6w+wUEIe/9rHTum
         LVqbbeZjxWu9PwVGi92HCgb7SDKK/I9Dq+GKlwqxmmU4cw8/1D2P8jrj379otMR3aMK4
         vkeP9Xj1O32MQjCQqFdE8r6UfKnqtqJhy6XbxQNHCnPmmHFQxG5ZrP5IZeXqcPCK0T8G
         Xxzw==
X-Forwarded-Encrypted: i=1; AJvYcCWThP22J8kz2R8XBiHcvSHJztmjOkXSG3LkWuTPtNpmtFXUzdbJphqrp3gnxrg1rp/9fj45U5vn6/CHMyUPsSn3p7+ZOau+RCc3
X-Gm-Message-State: AOJu0YxXFlFM4HaqvfQMt1R/mInblJNfiGobcXigZywzYBUJd/V4mumE
	PIn9RivZIQ2LmcohSNco3PFqftnPYOBAXZU9wREUom0xemJeGFTG2n4Qf8CNuhCaHH6UP/OhZ2j
	SpBOt+w==
X-Google-Smtp-Source: AGHT+IFKXGXpx8i2KQ1FEGtKCKhLYN6eLhyAip7+iky6sT8oW1ldUkwaE9/8U0ezvZisTo7Dk//ueA==
X-Received: by 2002:a2e:c42:0:b0:2eb:e365:f191 with SMTP id 38308e7fff4ca-2eefd0f66camr3721391fa.15.1721192914769;
        Tue, 16 Jul 2024 22:08:34 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee1914abesm13517351fa.84.2024.07.16.22.08.33
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 22:08:33 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eeb1051360so58579111fa.0
        for <loongarch@lists.linux.dev>; Tue, 16 Jul 2024 22:08:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWT7GySFwwVtX/9vhD6AkXyblnW7o8tGKpLWHui7Hfx7wHwK+TWk8qemddDCE7O4YBMRoAfTK0329bNl0n7ulL0bqI5PB0azEuc
X-Received: by 2002:a2e:3a1a:0:b0:2ec:5f6e:65ea with SMTP id
 38308e7fff4ca-2eefd1bf195mr3375661fa.38.1721192913022; Tue, 16 Jul 2024
 22:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com> <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
In-Reply-To: <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 22:08:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
Message-ID: <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
Subject: Re: [GIT PULL] asm-generic updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 21:57, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Note, it really might be just 'allmodconfig'. We've had things that
> depend on config entries in the past, eg the whole
> CONFIG_HEADERS_INSTALL etc could affect things.

Oh, and my "find" line was bogus, because it turns out ".config"
itself is only updated if it changed, which explains my confusion
about some of the other header files.

So it turns out that to get the real list of rewritten headers, you
need to do something like

    make allmodconfig
    touch .config
    make

and then to make it faster, you just  ^C after five seconds, and do that

    find . -newer .config -name '*.h'

and _now_ it's meaningful, and on arm64 I see

  ./arch/arm64/include/generated/uapi/asm/unistd_64.h
  ./arch/arm64/include/generated/asm/syscall_table_32.h
  ./arch/arm64/include/generated/asm/syscall_table_64.h
  ./arch/arm64/include/generated/asm/unistd_32.h
  ./arch/arm64/include/generated/asm/unistd_compat_32.h
  ./include/generated/autoconf.h
  ./usr/include/asm/unistd_64.h

while on x86, the only header that changes as part of the build is

    ./include/generated/autoconf.h

and all the other files I listed were just because I hadn't noticed
that "make allmodconfig" itself avoids the write of ".config".

So that "touch .config" is needed.

Or just use another file entirely to flag the "this is the state
before I actually started the build". Which I probably should have
done instead of thinking that "hey, I have this .config file that I
can just use as a marker".

            Linus
