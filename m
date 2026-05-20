Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F85374192
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779313204; cv=pass; b=VuF2/AJpd8spXfceMsy6BbS/QF7NLroGYjTGSjNbtofATirLaHr7hI+0eexLl0gCDUptJJNb3GfzjIThc6l0aezWeT+bxuAcXrFM0VcVrEYFg49U6IjJui+r2xroUkJEC91AyUIewRcu5NfDjAKFJWuyIZ0LpAUXPWT13z7VoMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779313204; c=relaxed/simple;
	bh=DBcXYzm6PYo0SCpYp3YKktE43c9Y4VDK8dmgRvqZUAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7Y0bvBWE2sV6rAht5HWHOLPJstWftxJi4VshZ0C5rTX+QDSjmtWs+EP71hYVlQqtSggJGNgj0LvK2T0jR5wWCLD+TT6ki4Jxm9fItp7A/qvHNF32iRiwq0atiqV7Iuwv1EkBYzPxr+AO6KeKakjne1kjnV5FLrPUclJcjsj6VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP77Z8pb; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP77Z8pb"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo11536904a12.1
        for <loongarch@lists.linux.dev>; Wed, 20 May 2026 14:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779313201; cv=none;
        d=google.com; s=arc-20240605;
        b=kyMLoUou8iGsO1O4dj7IDf3p31ZCvQsvJCs4kksb8doTgem8Um2N/YVLA1cFQ43k0h
         jw8ExwQDLM4ol+pObaT35pY4xX+Ya8dOanj9VzqDC5gxC5kodeC+xtfuDlUaazqY3g8x
         EBDWMQOPRPACXIKPdRih0+1PmMMLf4ESEx6ov2yeZW1OAuTvqcQfHSWGazTAoTGOeU9f
         n451IXvtRWOsFnbaUOyVEuWF2AC679eIe2h/GPOeCrFtboPSBeo4N7Y4a5tlA7pIfVPG
         RgQZEngSoMd8cPx8fnG72+6CSRSDCdr3Xduy3y2RLpOdiFOOXHKyKD8aO562lydV61lZ
         waoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmdK4vbjUWnyTBEm67qsNClqg8Ylwzn73Ycp8tLb8QQ=;
        fh=EZEMxFaGEJrO1//+VZnRicIXz2oFbgXx2/tuQqJ9MTA=;
        b=iAJ2YFTOwQ/uO2kme4J6b5OuhyJbpQOZwrxvYH1AF1tsLEq90G2SlF5L7KnvBXPu4O
         AWV98dZFORR8HwcDmjMGFRXo2otbyDgHY8ThaOt9U1wvZjrwS1YI6uFcSvq//GyEIZdV
         JXLDXkdpgCF3HFUA11iu51T3g5W1yvVCKUMBX+7IATtBi//OWmtfrxk+6AKeInOOIH+a
         ch6WdjEyjNlKPce97a1QtnCIub69fAmbrCMABD++2Zobt+rcAOtBBfWbMn4m9xcCtfkn
         RoKWGp6/4YqeGgFnWm+ehF5OwzmgQFcEwzk79jJL5RN/KtMqjxLLKLElFoJGTwD8vyhi
         /LhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779313201; x=1779918001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmdK4vbjUWnyTBEm67qsNClqg8Ylwzn73Ycp8tLb8QQ=;
        b=LP77Z8pbZv2IcdO5nhuEtXyKKbh8enZWUqNmGBuH3aPWIpgguw2MQWT1iBvn3m5yWf
         ZtD3ycl0DXQlC7AUp46mYkd7x70NQ1ykSUc4l6qkFM5Qtz6Nn0g24xiBu/G1C8VhQzxt
         XHzLvvHpqSgX0iBBF+2saMYdlhhN1Qz7B+ImuYZPItOUk0uxalhl42Amm64A4lSNBevH
         mWfDkMoKYsxCAduGrMLS0SmKQU5W5jO6j3wWs8vNCtwTkhKTvOgkvBaTLdZbByPBrVht
         UQLv6OZeXYoe2bHMPxHEnyZqvik2Ul7EIrKt/KqM8yAmhFqsdJ33MJsshZX6WX9ERgmE
         V5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779313201; x=1779918001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmdK4vbjUWnyTBEm67qsNClqg8Ylwzn73Ycp8tLb8QQ=;
        b=cX0NBKPBJfa6moz2ocNBVSswNOpcpvcvDbqMC6VP/N+FIfFIhr4A540BurDvT5PSRO
         nuspuNgaWA/buXOuaWJI7+2WtueDqhaRrUbIWELvjZ+zyHd1XjRYJVrGHB5cfQ9tCAjX
         C40NPa8Xi/SRtB/EfDrYiGfVbJwGX1R0h0TBagGS0gHSIbUFl/0vxFtUll2Bvy3RcT4c
         0zdDHm0df48KzIEwuIdnjMFILKjuWaFiIMzZ5wieYpRCAI4OfUqSc19fkvKWzGP8SQV9
         /NsMgqd37IkDjFctS9X1wBQsD1IwewAj4qwvb0uJE3f7Ncqd8a8hqaUZs2kgEJVLYaLh
         3Pow==
X-Forwarded-Encrypted: i=1; AFNElJ8rHBv47P9faI5w9feB/rTWcRRjT2ojBlhZB3ScE/L1YVQ9Xa/3yPmzA9Y7fdk5HzL5u+2OLDZghqo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVTgtG6duLy9bzwv91JCpv15Rk7wAHznaIdkVnHoQ9+NS6sd/C
	kDz83pHav1tF5Y6+KzP2BRQYW/4OewukQDK/mOaUZVXFyOm1uE3RlnGeTKUPLBWQ9L3Jb+dG35U
	b3btORVJUNqHtXI0r/X38RZA7+LBw/wA=
X-Gm-Gg: Acq92OG53nMB9riKSP2GsIiXw+q4MqD8TvxHPqqqiABtolV/k5wVb75P6DtJ8yofRwk
	FwUzoGzhHyWBUrWUlLvTXeg4mhI8+d5zp1msNlPznjRe3Wn0yS61hFMwSyG0l8RPz2ZrnP4NrLU
	i+vgoFOF86TgFgqaZXJkItmQd/VJXHm193hSeIGraRaTRudlEcS+TIbp3bUoC2iwgeV3dWpmsGD
	jmHAqDEFOIQbtHxpYg8uGsiQI8MerN0SZnyIy1cbdRpv4W6x3Rp5eeCJ2pbaKpzZmxlICVWtnHF
	nw6VAeEwUDFXoA==
X-Received: by 2002:a17:907:e14b:10b0:bd5:151d:2d31 with SMTP id
 a640c23a62f3a-bd51781106dmr1121316766b.13.1779313200765; Wed, 20 May 2026
 14:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer> <e6d1017a-e4c5-493e-bfca-932c6d64eaac@kernel.org>
In-Reply-To: <e6d1017a-e4c5-493e-bfca-932c6d64eaac@kernel.org>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 20 May 2026 14:39:49 -0700
X-Gm-Features: AVHnY4IxXAq80R4nUJKOoKG85hi3I-EgpsftnPlc019PI3pxbjgBD4oSC5VrWsM
Message-ID: <CAHbLzkq3S7NDYe4LXjurKNQU+40-wtqrD_PT18YcyHbAcNxiRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Barry Song <baohua@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:34=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/19/26 14:53, Lorenzo Stoakes wrote:
> > On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
> >
> >>>
> >>> I think we either need to fix `fork()`, or keep the current
> >>> behavior of dropping the VMA lock before performing I/O.
> >>
> >> I see. So, this problem arises from the fact that we are changing the
> >> pagefaults requiring I/O operation to hold VMA lock...
> >> And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> >> is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> >> anonymous and COW VMAs only while holding mmap_write_lock, preventing
> >> any VMA modification. On the surface, that looks ok to me but I might
> >> be missing some corner cases. If nobody sees any obvious issues, I
> >> think it's worth a try.
> >
> > Not sure if you noticed but I did raise concerns ;)
> >
> > I wonder if you've confused the fault path and fork here, as I think Ba=
rry has
> > been a little unclear on that.
> >
> > What's being suggested in this thread is to fundamentally change fork b=
ehaviour
> > so it's different from the entire history of the kernel (or - presumabl=
y - at
> > least recent history :)
> I don't want fork() to become different in that regard.
>
> There is already a slight difference with vs. without per-VMA locks, beca=
use
> there is a window in-between us taking the write mmap_lock and all the pe=
r-VMA
> locks. I raised that previously [1] and assumed that it is probably fine.
>
> I also raised in the past why I think we must not allow concurrent page f=
aults,
> at least as soon as anonymous memory is involved [2].

Thanks for sharing the context, it is quite helpful to understand the
race conditions. Because Lorenzo also raised the concern about page
fault race, I will reply to all the concerns regarding page fault race
together in this thread.

IIUC, there is already some sort of race with per vma lock. Before per
vma lock, mmap_lock did lock everything. So page fault happened either
before fork or after fork. But page fault can happen on other VMAs
which have not been lock'ed yet during fork with per vma lock. For
example, we have 3 VMAs, we lock the first VMA, but page fault still
can happen on the other 2 VMAs during fork if they already have
anon_vma. This is the status quo now, but it seems not harmful.

The bad race shared by David is caused by racing with copy page. So it
seems like it will be fine as long as we serialize copy page against
page fault if I don't miss anything. Since we decide whether to copy
page or not by checking vma->anon_vma, so it seems fine to not take
vma lock if vma->anon_vma is NULL. This will not introduce more race
either because setting up a new  anon_vma in page fault or madvise
requires taking mmap_lock according to the earlier discussions.

Thanks,
Yang

>
> ... and I raised that this is pretty much slower by design right now: "We=
ll, the
> design decision that CONFIG_PER_VMA_LOCK made for now to make page faults=
 fast
> and to make blocking any page faults from happening to  be slower ..." [3=
]
>
> [1] https://lore.kernel.org/all/970295ab-e85d-7af3-76e6-df53a5c52f8b@redh=
at.com/
> [2] https://lore.kernel.org/all/7e3f35cc-59b9-bf12-b8b1-4ed78223844a@redh=
at.com/
> [3] https://lore.kernel.org/all/2efa2c89-3765-721d-2c3c-00590054aa5b@redh=
at.com/
>
> --
> Cheers,
>
> David
>
