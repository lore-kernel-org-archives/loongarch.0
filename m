Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F3371066
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625179; cv=none; b=ADLegVGXhV+oV2Vj64Rj5QDdSJ6G5/SCKlW3H+g9mryGQlq30vDoyof+HqNG81OuLhJOnIOm6A0NXexzjTI6wdueOmvxR4/8H21ZF1LxqYtNDrWuqNGeCOlRnAb4MTvt/NAH4d3gkP3X9lAzcTtMZji/uTfvwAp2H+1A6ppWbt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625179; c=relaxed/simple;
	bh=OBdwcZUm6PgM3WhIEW36ryu3bfpAIHNKO61eL0eZiMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Km2QS6M0ulgpCwYMMBGf+O0/hUDL798tU4+GDXck63950GAFnMfqcArNESvf6p8V9E6dr+WdVvByjuj8gpFYClWv2ZUI9GRaLbXsatiM6TZ8N06DK80/9F9Jc9/a300/BEv0v1VweP2/AYCTzJfT0ksPMObTQ/2yIa5sg7jdvcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IT9p7hQM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IT9p7hQM"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359108fd24so115582f8f.2
        for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769625174; x=1770229974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfg6UdscjkpEoTOhSlRT2LAj46aYr5XBfZJkEddMCkI=;
        b=IT9p7hQMsrvzj5iuLJl+9vahgVyeR+v3ec3JMPgKC/OlgdaQO366aV9aQNQVTQtT4q
         0Rv/IqKuUvXLE8jA6/+Da8wesLgNlTeZNy2Pg4Us3BserRAWC29n1Ci58mxocYyu7q18
         MRP9gMjvSbV7mknCrpjQfm/LyP8A++CfKjooNcwXGEGFSruLNVktGV2VrUXKtcvNC0XS
         IYjGaxfOyOsO8cuEyKm5sNFLI6/c1YY+oPKA4UGrB5HtyWoT0f0mbTJkuOPcTnxf+/9v
         nKcdTvxLOSzTC/X0jVBQbdukfqzqF5wkYRORL9Y5X2Xt0l9Hm7X2RZ5rts3GRVdK1SLp
         DYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769625174; x=1770229974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kfg6UdscjkpEoTOhSlRT2LAj46aYr5XBfZJkEddMCkI=;
        b=sr3S1QvxFwLE7Oy/jg+WVvZcAEoL6dql5TaMTkv+p9XEE4sPKTxMznhJlqQ4p7Tjjr
         BqKKnxzHY45hwndCfeUULUs3qSjTykseGzR72RpenBu2Z4+IASntzf+NCOxRZQzmoD0D
         qGSw50K/ijfPkxe6T3VvBaJ2yOJTWAK2L9+fz7X6ku39ciq+vUzBbomGy3KI7puu0yIq
         HNATtY2DmjJbm/1ctzmtEzWxAcLVEJ3RUUZQKmYkpf2dUG4PdqNSSyKYuunygFMimO09
         pQsYM+hDlek0ABZghUGzTr0xDvdn7QXetHcuC9wS+NOpUCP2YHWtyFbSmskt+MyDdc9x
         9zOA==
X-Forwarded-Encrypted: i=1; AJvYcCWwuOCuk2bC3tXg4EjEEJ+Wier0yimVHhugkNsjMXHRoHBlv9zF7k9A4gS1UgRGJGJ3xyHB+tWN1KI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdflPCu3QTMr1rqCyTUacMBqPXLmxAQpHKjyCd1bMcVg251O+/
	0V6FsqfahdzDojreHc7OmWonKBZb6BZQ1xq9a0u+Y/kzHw7C7sZPK5Uo
X-Gm-Gg: AZuq6aL+MTRhEWbfSoEM/Ybp/HoaWUY+iBww/tiRXmVB0p3m5CVi6oiwjrSu69HjNd/
	rhLlZATC2PwCkJHypoU6jF8JG56tnFuc+1Rev5AezBHydA8ZDoMwJ/yZSeNc0J4XJZhmx9XTw80
	NGsAjCoH3uLCRwRMVRw7tIm70thIMnMlYTORTkkHxBTyW3wHNN88dp+RDKvL34dUH/ECg3y7P59
	ix0U1yV7eLsIsrBhZBgQ8zHN/lrro4zjFjFQv6PkzEb3I09LoVtKs7o8gtcze5R14ecyt8G4+Oh
	fHCTyIgzAMKhrzzp3OvSIRzmY2b0br+RxCLqsFa9br0/j8Hud6xfuNC2OkfzA7NKDhhs3WzIXja
	ZsQBs5wsF39whdUUdczoX04EmiGluHkFf9bcmmdgpvUpAB4PXJcJ72Z/NBZJzkMYN6+XZk5To/c
	dBMLxUZYfUv2cL7DuvM768zZn6Dqvf+dvV62oboPnJsnOh7PpFl0B6
X-Received: by 2002:a05:6000:3113:b0:435:9241:37c2 with SMTP id ffacd0b85a97d-435dd01e23fmr8152542f8f.9.1769625174058;
        Wed, 28 Jan 2026 10:32:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm9165906f8f.26.2026.01.28.10.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:32:53 -0800 (PST)
Date: Wed, 28 Jan 2026 18:32:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 2/3] prandom: Add __always_inline version of
 prandom_u32_state()
Message-ID: <20260128183251.7177c345@pumpkin>
In-Reply-To: <670c2b78-02e2-4617-80d9-3c896077f02a@arm.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20260119130122.1283821-3-ryan.roberts@arm.com>
	<aXpArjZ1QQowshnA@zx2c4.com>
	<670c2b78-02e2-4617-80d9-3c896077f02a@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Jan 2026 17:33:19 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 28/01/2026 17:00, Jason A. Donenfeld wrote:
> > On Mon, Jan 19, 2026 at 01:01:09PM +0000, Ryan Roberts wrote:  
> >> We will shortly use prandom_u32_state() to implement kstack offset
> >> randomization and some arches need to call it from non-instrumentable
> >> context. So let's implement prandom_u32_state() as an out-of-line
> >> wrapper around a new __always_inline prandom_u32_state_inline(). kstack
> >> offset randomization will use this new version.
> >>
> >> Acked-by: Mark Rutland <mark.rutland@arm.com>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> ---
> >>  include/linux/prandom.h | 20 ++++++++++++++++++++
> >>  lib/random32.c          |  8 +-------
> >>  2 files changed, 21 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
> >> index ff7dcc3fa105..801188680a29 100644
> >> --- a/include/linux/prandom.h
> >> +++ b/include/linux/prandom.h
> >> @@ -17,6 +17,26 @@ struct rnd_state {
> >>  	__u32 s1, s2, s3, s4;
> >>  };
> >>  
> >> +/**
> >> + * prandom_u32_state_inline - seeded pseudo-random number generator.
> >> + * @state: pointer to state structure holding seeded state.
> >> + *
> >> + * This is used for pseudo-randomness with no outside seeding.
> >> + * For more random results, use get_random_u32().
> >> + * For use only where the out-of-line version, prandom_u32_state(), cannot be
> >> + * used (e.g. noinstr code).

If you are going to respin:
		(e.g. noinst or performance critical code).

	David

> >> + */
> >> +static __always_inline u32 prandom_u32_state_inline(struct rnd_state *state)  
> > 
> > This is pretty bikesheddy and I'm not really entirely convinced that my
> > intuition is correct here, but I thought I should at least ask. Do you
> > think this would be better called __prandom_u32_state(), where the "__"
> > is kind of a, "don't use this directly unless you know what you're doing
> > because it's sort of internal"? It seems like either we make this inline
> > for everybody, or if there's a good reason for having most users use the
> > non-inline version, then we should be careful that new users don't use
> > the inline version. I was thinking the __ would help with that.  
> 
> I'm certainly happy to do that, if that's your preference. I have to respin this
> anyway, given the noinstr issue.
> 
> > 
> > Jason  
> 

