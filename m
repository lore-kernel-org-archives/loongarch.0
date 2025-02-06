Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1215C2248AF
	for <loongarch@lists.linux.dev>; Thu,  6 Feb 2025 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832043; cv=none; b=BZPiSATrxE4MYyge+68AYtBSIkt6tAy7RMVqUC8+5WCyE4AVppV2qDwsH6o1Rb48pprJcQHRkiLtxy8mEw7b5ZBcqBXGq/PvsWNTtWph1JOggreYRQKOHHOcacMSVLs6myaBNS8D9L0FqOlSxL5jTu4ISJoHJaP/ziFUntHM2Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832043; c=relaxed/simple;
	bh=O4Y99wLIZt5HigjK77gneneZZSdsJM7zvVgoZ8+vvJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DgQWDPF/7sHrIu2WlmnhW1+fsp4B33TKSob0fsE7udW8ZNEug7rMDdvpARGXm9g+4wVr2E0XVgM+7xeJ5Lr/MORP83nJzg3zdYONsTC0fOClqnhR64J8X+OIFDY9xCyHIf8eigBwc+/CSq7wAXbhzAXLpdWzrk53rJXm5nNIo9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ljM+M+nH; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ljM+M+nH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738831032;
	bh=OQ7iIR5qM+sWvITBpGMCDcVBhEoGye+nzy0tYomJPkM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ljM+M+nHJuZwFhwFvdJnd37x3dmNYDV7vd/TC6wUs0eji46bYahxipOqdfGjR/z90
	 ev/z+j6FS5nC1SCSJ4/BLyu7ahbiS0XM55TremvyW37sFTrjvRJGAiiaWv2zvOGfi0
	 meQomYv6MLkLGW+loJm1qRDmb5Zq/Eg/fggW9J40=
X-QQ-mid: bizesmtpip2t1738831027tx2q5lh
X-QQ-Originating-IP: z49N5IvJbdUnc3tmQDxAkyLkZWVnWMWOUMvl/ipEl/Y=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Feb 2025 16:37:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11712325770140657364
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: ardb@kernel.org,
	chenhuacai@kernel.org,
	chenhuacai@loongson.cn,
	kernel@xen0n.name,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	masahiroy@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	sashal@kernel.org,
	stable@vger.kernel.org
Subject: Re: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where possible
Date: Thu,  6 Feb 2025 16:37:02 +0800
Message-ID: <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <2024120635-wham-campsite-b62b@gregkh>
References: <2024120635-wham-campsite-b62b@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NKv2G1wnhDBnrKKlRfuXfWfW3B8oOk0X9ASdVeC3ej/f3pWRJxj56Ca4
	azvsSEd/PsqmIg8luIQEFN9UE/pDvBvKuIu1Vkpr+e/v+GUd4nCcQ8X++3M8DNUjSHY0e8g
	HRrhUYhuCwxBwapJ0t+htIYQG3fozZAsvGtPHKmDp7FvzSNX4ppx3rzlUkWLo9/OJHi8VoD
	9bUzZiVrOxdXmt+dAHlu5ZRzj/DkTgYdJq1g7hXGHIk2dgfXS2kKAyUOC4z0/bPADjfbDdV
	4H6GF5NkufSy3W1ITkanEd8xKzQlU93nGfqiPvUSDMuY/R7EcoClxCj6Z6wLBjYoR32mf2V
	1QNCUKZvFAFKyI4Q1bYZp9Yl4u8LvHbmzt113+MQIxzdkqhzlFWjod0XC/jaKx3q/FvGqIh
	Yfl0UNRYrgJUJULn344Ja2jX/HZ9s8llrzJh6Xa9P9428/PSChKgoVH7hIw44Qux68GEBCO
	IpxXzDCUZbJfUiPiRGMRVocbTldHpEfIs+Gz4J+UxDR/mJdivpRQsH/IkYXqEk5MtQ3r6SB
	dZVoxmVln15hw5sOBeRVsFfLWVhTA/rhqAvZRfqxRq1Zb5Vcl44kuH566U4BH3HqA5fQ7fR
	c/eI/85vw+rHpP21d8lLYWdNVReWWkzRgkAuTMPahAo9Fdlwv5Fe8js+udOOvPINCCvWzTM
	eQj2v+pX/GHMptnJZ/ER+fbr9YbOmUk3ixWePbwyK6vcGRSxzoLtVGUEzBINCGkpY94oCGK
	pHzgB3Mbdg4XMnK4o6mT6+Ji//7TkJF/o4Fn4cO7UXRRlv98pMLFEpu8Kq2tALiC/bO2FlN
	zUY4Jy9F1jVF3e/yaRdZI9axsXoMAK4B55rWFPuEcpIZfMBCwGfF4y1sjwB4g10CScPlcfX
	wUIpPmq6YIPw+835rkLTpfoUS1peVlxO2TGdJ5/sn+dk7M8qd6zzYNA2jJEuds/1fUchsQ+
	WR1FytxmeL9TWVC7Q0o2scZRJQvPhlXex6ECaBnyzAlK+EWzJlzo0luxSxlKvqta1cnSnYS
	1YPg8LZQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Hi, Greg,

It's rather unfortunate that currently, almost all Linux distributions
supporting LoongArch are using LTS kernels version v6.6 or older, such as
openEuler and deepin. [1][2]

If this bugfix isn't merged into linux-stable, then every single distro
kernel team will have to waste time fixing the same darn bug over and
over, even though it's already fixed in later kernels.

This would really make LTS look like it's failing to serve its intended
purpose. And I'm sure all of us do not want to see something so terrible
happen.

On Fri, Dec 6, 2024 at 9:04 PM Greg Kroah-Hartman wrote:
> Odd, why doesn't this affect other arches as well using new binutils?  I
> hate to have to backport all of this just for one arch, as that feels
> odd.

Could you help me understand why you expressed that you "hate" to have
to backport something for only one arch?
Given that we've historically done quite a bit of similar backporting for
architectures such as arm, powerpc, and x86...It's not exactly unprecedented.
I just want to grasp the rationale, as it all seems perfectly justified
and necessary.

Moreover, with all the active and strict code reviews by all developers,
such occurrences are not frequent on LoongArch. You could be not exactly
"always" backporting something like this just for LoongArch, so perhaps
that might make you and your colleagues feel a little less "hate" :-)

As for your questions on the root cause of the issue and the effectiveness
of this fix, I reckon Xi Ruoyao's explanation and Ard Biesheuvel's
supplementary points have already provided ample details. [3][4][5]

If, after your feedback, you still have any lingering doubts regarding the
issue itself or the LoongArch architecture, I believe that Xi Ruoyao,
Ard Biesheuvel, and Huacai Chen would all be more than willing to elaborate
further.

I'm bringing this up because we've encountered concrete issues in the
process of maintaining distributions. Furthermore, as an upstream resource,
linux-stable can help us more effectively drive forward community
development efforts.
Plus, we realize this benefits all Linux community developers just the same.

Hoping you could spare a moment from your busy schedule to take another look
at this patch series and perhaps reconsider the LTS inclusion of this bugfix.

[1]. https://gitee.com/openeuler/kernel/blob/openEuler-25.03/Makefile#L3
[2]. https://github.com/deepin-community/kernel/blob/linux-6.6.y/Makefile#L3
[3]. https://lore.kernel.org/all/ccb1fa9034b177042db8fcbe7a95a2a5b466dc30.camel@xry111.site/
[4]. https://lore.kernel.org/all/CAMj1kXEV+HC+2HMLhDaLfAufQLrXRs2J7akMNr1mjejDYc7kdw@mail.gmail.com/#t
[5]. https://lore.kernel.org/all/c9a43e5da01ee2215393c0f3c50956171fe660ab.camel@xry111.site/

Best Regards,
--
WangYuli
