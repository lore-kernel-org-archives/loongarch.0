Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3140449365A
	for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816557; cv=none; b=e4sGIyQ++HnUQijRPBJgQzsdkORolMdbpDdXsoVlXdNQLDSvSCgq7v9OtW4Yp8KBLS2/oA4Z82D8CnFMQMBLDBUe7eYJD6iZoJHlzklc3o7ZmNAa4pLHAR7yoXh3HBAwwrYtN0dcQ9HUZr980TZSJNqHhViU2wZIglK4WvOKUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816557; c=relaxed/simple;
	bh=HSaqZ/vs2+B1i4yUCchBv9N9j074kQN43Wfdo51BDR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdCSqHsMl4HFQMdt4MEpdcCOeLpfWw7xbxlzm2AnBDl+O5QFp5+XFlmxERj/uJJDHtXEwBLxGGHXQaAwws2nQCVMKlfwTrVltbsAeR+q+ooVZALem1enIzlALOHJctecTNJdvZlTbEHd2Q3t1ABM2Jxj/CKIRUmEIwH42ZpIiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLGlDzx1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLGlDzx1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8E21F008A2
	for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791816556;
	bh=HSaqZ/vs2+B1i4yUCchBv9N9j074kQN43Wfdo51BDR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SLGlDzx1SREW7k7fqRSRwU5VGy98UhXB6Pgps9U5JUJYEJD5pLYGUff7KZJplhHyD
	 IZPEfbdOIsREUoxISkK8utG2570R75ODLNMP9WBfYU/AAaqmjsu/WljYRZn/Cwj+ZK
	 VVv14O8xJPkoFlKJ43TN1niZDuaBOiTQHUdjbSNSIsqEBvlZA6c6xIeu0WYBJYzUes
	 hgKi27UnxsppHjZjVCl20kHVNRPN9qu4tgIyHpalBDfP8JiIf7s6Bhv3cqwpnEKxZ3
	 AT0plikL313OAlS5vOS7a7Kj6OKjn0LmlyKdppkDT2sK83Kt25ztJA3Z6R18xQ80QG
	 pHrP0uved81QA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb2eceb3eso1523913e87.0
        for <loongarch@lists.linux.dev>; Mon, 12 Oct 2026 07:49:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRwlSl5YFb7e8/T+xugRIREZ9fQ4wfHggGQYSJokDwp3kUp3iTYDR656Aj7cENsjkFBAAtzcdTlZo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJaNXUn7g0avPYnACfoliZiJFl+iFHutM19NXcZyZYD2bQPFqDP
	5bEWs8811fJrtxSN6/r/CcFvkfa10hk4vfPiOlKCJBw+o+UyAB285pXACjckrD/2RVWkLQE3Vj9
	VPAHAGAoX2ZDyMwJVikkeiImzeP3+mRw=
X-Received: by 2002:a05:6512:1302:b0:5b9:8480:88b0 with SMTP id
 2adb3069b0e04-5bcde6cd81emr3590336e87.46.1791816554296; Mon, 12 Oct 2026
 07:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922121058.972734-2-maobibo@loongson.cn> <10bd45f8-2d37-42f0-b7d2-a4a84933c9b3@loongson.cn>
 <CAAhV-H40TW01vpaNSDgm86DVM4Mwf0sUvnAt2KEwUB=pPFhhqw@mail.gmail.com>
In-Reply-To: <CAAhV-H40TW01vpaNSDgm86DVM4Mwf0sUvnAt2KEwUB=pPFhhqw@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 16:47:10 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gpFDaS8sLdDBbS4tU-F7fKPKOkXtb7nqjfNhagEB_Cgw@mail.gmail.com>
X-Gm-Features: AclHuK_yh6nJbDMby3wJpiRQ5ov-r1gjRQklEy0qVxrWW-6ieFaflZzFuZVP5uI
Message-ID: <CAJZ5v0gpFDaS8sLdDBbS4tU-F7fKPKOkXtb7nqjfNhagEB_Cgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] ACPICA: actbl2.h: Add bit constants of the Flags
 field in the IOVT IOMMU structure
To: Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, lenb@kernel.org, 
	linux-kernel@vger.kernel.org, lixianglai@loongson.cn, 
	loongarch@lists.linux.dev, maciej.wieczor-retman@intel.com, 
	pawel.chmielewski@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:21=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Oct 12, 2026 at 3:16=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wr=
ote:
> >
> > This change is already merged in acpica tree.
> >
> > slightly ping.
> I will merge the last three patches once the acpica changes are synced
> to git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git.

I've applied the $subject patch as 7.4 material.

When it propagates to linux-next, I can expose it on an immutable
branch if that helps, in which case please let me know.

Thanks!
