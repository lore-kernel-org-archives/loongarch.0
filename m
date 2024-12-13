Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22309364D6
	for <loongarch@lists.linux.dev>; Fri, 13 Dec 2024 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734110212; cv=none; b=n2KgJEwRsGUzecWNgHpltz8T4sddqQrLnQLGrxHpntNEbBNdXmoJs5NvIZd1Gk1s5ipxeebbzLokJGnWEJDVUUKVxqTVqG0gXb10whbFg1XQiWBMO13TsGq16xveL3Io/zoRRnnW5G1GDA7XSlzjlmp//iRd6XZu9/a2kdwTGX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734110212; c=relaxed/simple;
	bh=wE+q7QeqF7YQbDHKzcLUrEGn0D/xKRMVNiL8FZYTzQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CAehlc2m8uVCfbQmKk6e1GHW47XR2Kv+hlevVbBspoNpLMf9Mn4WHK4L1xzoU56J+H8fvRkRqfbYeVKNcDM6fQoJMoqU/l3yQ5WprENMyvc8Gd3de+muQtBX/oxdRfwmdQFSQOtpqtbQf5bs8tgI6FOnuBuaI5Rsl4C1wW1yzZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HHyBVh0I; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HHyBVh0I"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401af8544bso6782e87.1
        for <loongarch@lists.linux.dev>; Fri, 13 Dec 2024 09:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734110209; x=1734715009; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=HHyBVh0Ib5I5geZQwK2HGzeEgEs2WnSBE1WN3oWm5riTY5MpgCFV14l1ULikT+Jwgx
         W7g4haGB7uhHpD3ekzWdfPuX9NmpSzHuQdEQTS3lPy3wtklaoSjmET4gEzbxj3ruKo4c
         BoeSDDyUSnfU5tyPrZzC1A3+Pf0iyh0euRP4F12FZpVlEJ3XiyNwkqKB75PCvnv+RNp5
         O7UTQoi5jWa9N8osV0JodKK/GN6QCj7StcOCCWre9Xs9b0ijFWEgdL9WMiwFT9eyVFje
         I08tRgP+fln4oAA+EZK299Cv++6/NKFBlZ4CRO76DYQd6EWJ6zNlhop+qaKw/yr/s3dc
         iCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734110209; x=1734715009;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=s+Tzsix+f8NXlWYsPEMHxiC4opkasqeyHi+vchtVTUcFTp0EZyupfxn9w3Tg0yt9rY
         1TOPTooRVo4SukksUo7QDOhP3No4B4HEsFHLC+2m3meJLequO6TtDo6AXxyQ9TYQVa3k
         z3VyBzTZOloHODEgdboJVPFKxwgd70LaBoWWilXTBNcOt+edvLbfgDAz0b/89dejC79k
         sL+oIH0C2vJU94ujfQDdqRnvTzo6BUf5DZzwUJD7Yft7szO9HQX2QW355ye4dydXAq0E
         Qe6SRRyRlLQNXHKkS4F/RKKIjSK6qfjuTMAPXwRX5vVfVgXfG0xU6V16d+MmmzUG3vsa
         DBLw==
X-Forwarded-Encrypted: i=1; AJvYcCVPDF6KAWgQPc9gaByu0wPyU4ih6KEVdVGugaQchoMj5TgP1kkmfjHUbiLV1g9SUwUqVs29jntcHpA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRnQS4aoiDiku+xbg2DdYjX9Tzv+YRVNsdB2zYossgc43hJOVQ
	cTtBImdiWptDHXS/DaNPAxNjud2vKE3jxowUOYatfJbSAk/7b+yhKuLx8+YAyHj8Xudp9FycH3f
	9mfN5dqz/YO/3geh2BQxCEL718Mz2Mj3Ca5jOg9J0MT/rvi90kJdcHoBLFQ==
X-Gm-Gg: ASbGncusoOjC2dwU8OY2zIFMCYSqPD2js3Xu1IxdJbp9amByUnbavo2CmnBQMY46EOv
	RKe8ibz3yVKyi5YUTPIyJ/8NY+x5XznSWAJoLWw==
X-Google-Smtp-Source: AGHT+IE0pzRAvhpWcDoHVTc25a7VJDPqOoxFfUFUvV3kZNJPG0d3Y6hVFQO+pd+M5jbFDlDiTJn/R0kKY+NzL+UHXcQ=
X-Received: by 2002:a05:6402:1517:b0:5d0:b20c:2063 with SMTP id
 4fb4d7f45d1cf-5d63c09e36emr92135a12.7.1734109713373; Fri, 13 Dec 2024
 09:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local> <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
 <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local> <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
In-Reply-To: <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 12:08:18 -0500
Message-ID: <CAC_TJvdZxQ0-O3Y1bzH0-XdjQYuJPkkpn-umVan--Z6As-tSow@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 11:45=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [241213 10:16]:
> > On Fri, Dec 13, 2024 at 10:06:55AM -0500, Kalesh Singh wrote:
> > > On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
>
> ...
>
> > >
> > > On the technical side, Liam is right that the copy-pasted arch code
> > > has inconsistencies (missing checks, order of checks, ...). I agree
> > > there=E2=80=99s room for further consolidation. I=E2=80=99ll take ano=
ther stab at it
> > > and resend it as an RFC with an updated cover letter, as Lorenzo and
> > > others suggested.
>
> Thanks.  Can you please include what platforms you have tested in your
> cover letter (and level of testing - booting, running something, etc).
>
> If you have not tested them, then it might be worth it to have it as an
> RFC to point this out - at least initially.  Some of these are very
> difficult to set up for testing, but it is also possible that you did
> that and the maintainers/people who usually test these things will
> assume it's fine if you don't spell out what's going on.
>

I build-tested most of these except (csky and loongarch) and ran
android runtime (ART) tests on arm64 and x86. I can try to spin up a
few of the others and will add it to the description.

> >
> > The most useful thing here as well to help us understand would be to wr=
ite
> > more in the cover letter to expand on what it is you ultimately what to
> > achieve here - it seems like an extension on the existing THP work on a
> > per-arch basis (I may be wrong)? So adding more detail would be super
> > useful here! :)
> >
> > We do hope to avoid arch hooks if at all possible explicitly for the re=
ason
> > that they can be applied at unfortunate times in terms of locking/wheth=
er
> > the objects in question are fully/partially instantiated, VMA visibilit=
y
> > etc. etc. based on having had issues in these areas before.
> >
> > Also if a hook means 'anything' can happen at a certain point, it means=
 we
> > can't make any assumptions about what has/hasn't and have to account fo=
r
> > anything which seriously complicates things.
> >
> > Ideally we'd find a means to achieve the same thing while also exposing=
 us
> > as little as possible to what may be mutated.
>
>
> Yes, I'm not sure of what your plans are, but I would like to see all of
> these custom functions removed, if at all possible.

Initially I think we can remove the mmap hint portion of the logic;
and follow up with removing arch_get_unmapped_area[_topdown](). Some
of those may not make sense to consolidate e.g. powerpc's
slice_get_unmapped_area() which doesn't share much in common with the
rest.

Thanks,
Kalesh

>
> Thanks,
> Liam
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
