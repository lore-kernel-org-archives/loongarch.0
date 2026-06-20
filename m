Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02128373
	for <loongarch@lists.linux.dev>; Sat, 20 Jun 2026 23:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781999351; cv=pass; b=Rp5OjuPyHynNRoN6AhZ6AuroLHLvDRgt8eD2IGbmg5l1wMPqejfwosjR/atW3QfQyZYGD6UTvwlL/wovA3opdZ+KiTb6UT2/QfQoJAaNXx+VlLepGTj40EFfbX+tbI2kWQaaxvs8pWI1bUtP9plVFy9ATBzrrQ4GjPdshaNyNrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781999351; c=relaxed/simple;
	bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRBt0IqFkAoAebQoCm8bj8cPAhnf6nRSOx8PH4h8l0A3TRYvCY18LDovWD03MsRhL44t4P/go5FQy1JvUzf0DP6Cw/B6vd5wDsTGU3+JEjtHreMh1WCyNY0sxLskXfN+pepEc+w49pe1fjcaBtIKpIQpM2usmfZZJxtwtizHf8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=suJNqeH+; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="suJNqeH+"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51765331535so371321cf.1
        for <loongarch@lists.linux.dev>; Sat, 20 Jun 2026 16:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781999349; cv=none;
        d=google.com; s=arc-20260327;
        b=oBGPxIuSlEihdLV91r0lanlcs6gTFsXtHU/eo33FO7+UVr4cLy1kxepN4B3QErGPUP
         CmqSjOjxoYPwCxEIVZlmMv/2T/koUFS3O7ZXdDOpb+uHlvmkPXjI9YeJ1H8Vfhl7inbt
         j1GtOLKcBiFrCuEDJR+qY4+ITnVZhMOt+isxCx1bDWpDkifQ1Gd8wSrdT3CgPurr1UtE
         tJM8zV5Fs2cH+Px7Pt8K8LnW9FIVS+nJK+XdFj+WfMznsr8VQ2GcK7LNTyswKnzeF9iO
         pPV1+IXJygjYF/HDdSfafKfWP1J3oydxVQ9syIW0cgz19xriSXpmDDSmz8YG7fO8Y0+d
         imcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        fh=xA4BMwXIbpOAcyqppGyXZwSVC8zcl2/othMJ6e/pYHo=;
        b=IGCP+vzeJxBDT5P1vjuUTcdhMFWdfYy9F5s23cxHMPDMBPr9eYUpaM4vkxvzn4sZU4
         vV0lt6IbliuLvYtHQxsLIg6yPmnD06e3dy7c02FtpKI76bpOoowjkWKPR31fBjsF+qqM
         Ve6/0655KpAT4YxbZ/x7AeNxRpyILLmBeNHJUT8OVq2dQO+h1f6ZVBasijJ0rHjFNlRX
         s7ubEJCuSOxDmH47V4TTkXEfXMw/UQYIfWeTLeGsccr2+MG8tzTm96YNuM0Ng/8h457K
         YAcE8TAStADCoYQq1VXLWsMKWPhv5YA8DkkpWIpysrs/alhzzg8JFoDC9tGT9iP1kcIU
         RpEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781999349; x=1782604149; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        b=suJNqeH+srsuMQvprLjDKtiVP0S4rwqS/4HRhz8L7GJGQOEHQJeMMHY1sA+Oj7Vdp4
         xZts77nW8ZQZq4lD1PNEp1L9vAYNqpEwsYFfzAKVJZjbWxmh5OSeE7M0io/hnuICatu4
         mbMZ9EbwEaJiOMAlURpdaX4NlD0x7R9Z41quqEdtjp4ym8mTdvvbl6cUBenjay7Lp4c4
         uPVZ3n9zDC1hAZNE4I9P+w3SWEfLOB0IvW6hNOcvuJ+axZn3NMKcQd97wzcHGvj3Q4bU
         2F7qDGbSCCQEtK6HkDoF30tNU9PVBXpD3/mI/8f7jJpGccav7tO5SsciuKbk8Pvl1xZr
         qBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781999349; x=1782604149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        b=CMqQEpyj9NXZIa+sOnRzsmzBtlr+f16PukG1BcGFZcPVjYoEtwFSud7O/bkPpmw5J7
         AKGYQMxHp57fvW1SoWnd19mDezudk2Hir0CfbtE+DuZmZNsvp6drxgjUG7e9Qk2/0Ml/
         tI53gzbYaxngQVKk7m3l+YU1NloFLCyzI38gdyB8tcRXeKK/rbnYD9JktGo68RN6+glS
         g+FrxVdBIh1c1xeIqzXiNZxDeBU5NDiZeY6l5LekA4AatYQv7d0XxA2tIYoyuINlGfac
         sR7hmWGAEU9XtiGe7rloaYAIkbyIDN4xQ611yczsT0VV/hcfhndAaO23chF0+DZczPHS
         Og5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/uI54rHeimW+QZOLVbITF8yyLnAV6i6ZfdpDB+6lMikk3BXgTf+a90o+J+iXyDaoBBBvnqRmc/VMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyR0u6tVjytfiPhGL74txxWg8Cx7wsmVx3xKkNFBUWqrmyEuxRn
	RCzkGe/bQ0nKqPYvTO85k8a6SwiU5WJaBwT/4oeQy12yfBYP3XcveaAxY94FET+Smwpiy6GQ1OH
	Bx4LhhVw2hnalBFrLLs9KJJg1aVOBZBUM4w/7XYjP
X-Gm-Gg: AfdE7ckoVzGvEc8owT6QQo7KQhv3m37+r5bQhyoLQihyG6TInt2oriftiTUJnIciwRa
	3pAwN3gxNP1pNp8TjImhJwMjKB+ROzFQvujnCRsmMcYonPxA+irjKbUN/QwrrIjqsptMZYw4Twf
	NbRSrlbAG+clyRziqIkjHYw0N5Gh2Zt5syOuUDGgSA9l87Q/gyQ79gDMX3s17DY4lBuPe8s2Cbb
	EeLqnYKkEwWqsdmSNHnJu4WxV0sGxGHCymIkZtQET/j1LIq5StltFfadAUJngQ9XFgReZu0Yp5H
	EUom3w==
X-Received: by 2002:a05:622a:580a:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-519e4a744d4mr15890001cf.22.1781999348457; Sat, 20 Jun 2026
 16:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org> <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org> <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
 <ahB6QyHgYq8ksj65@lucifer> <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 20 Jun 2026 16:48:57 -0700
X-Gm-Features: AVVi8CdrqLszoGfh6nxxBjM6ZU4jlgAaXlfN0swetCJNc_4l9-uU6mX0T8CUJHo
Message-ID: <CAJuCfpHTxaU4KdNmefU7C7cWZSLCFDLPdUrnqV6yzxzN+8RQ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
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

On Fri, May 22, 2026 at 2:31=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> >
> > Again this is making me want to sit outside and sip on some lemonade an=
d
> > ice :)
> >
> > Yes - android processes are aggressively multi-threaded, sure of course=
.
> >
> > The missing bit here is the forking - what, where, why, when?
> >
>
> I really want to know the what, where, why, and when
> as well. But since most applications are not
> open-source, it is basically a black hole for anyone
> other than the owners of those apps.
>
> Let me try to do more investigation to understand what
> is going on, although it is really hard.
> To be honest, I would rather the Android framework
> completely prohibit apps from calling fork(), if
> possible.
>
> > And then you say zygote is sometimes multi-threaded but sometimes
> > single-threaded, which is adding a whole bunch of confusion on top of a=
ll
> > that.
> >
> > I don't find these stack trace dumps all that useful (though thanks of
> > course for taking the time to gather them), I think we'd be better off =
with
> > specific data on forking, in some _concise_ _summarised_ form, ideally =
with
> > numbers.
> >
> > There's such a thing as too much information :))
>
> This trace shows PF I/O in one thread overlapping
> with a fork() call in another thread.
> But as I explained, I really do not know what kind of
> user behavior is behind it.
>
> >
> > Anyway, again, please let's see a new _RFC_ with the approach proposed =
by
> > Suren, with some _succinct_ data demonstrating _exactly_ what the probl=
em
> > is, so we can make some headway here.
>
> Okay, sure. Thanks for your patience.

Just checking in on the followup plans. IIUC the RFC mentioned will
try to implement the solution we discussed at LSFMM: splitting
VM_FAULT_RETRY into two flags - one for retrying under per-VMA locks
and another one to fallback to mmap_lock.

Barry, if you need any help or clarification, please do not hesitate
to contact me.
Thanks,
Suren.

>
> >
> > And now I'm off for a cornetto! :)
>
> Sounds good :) Enjoy your cornetto!
>
> Best Regards
> Barry
