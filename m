Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA136CE01
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930376; cv=none; b=nhTHqrPQgWSjCCQqf9UaJ4uMp+Gg4tAmoeGm3PBaxxQPhtPrmFfS+aY5YEEoEdpKzuTYdXXNCIcFcxEGUN50R5NMSZgPiqA0kQfofWwvw567jtOF554s2PV+sAYCyMLxud+2SfewAvafxr5AC9ytDvN6Nj+E9ctEPR/S5qeLP9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930376; c=relaxed/simple;
	bh=EfYzODYTn0NTm+Mvi25JjdLYLxLuMewomF3tXPZzqjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZl3p1NL64DW8e23FzDbqRL5/AtPQlbooVCtq1quvqd2Cy9XdxbJoQwaADNhygAX5rMeEgjgz42o8kKdbmXzKqqWMxnl7k+y6x+/my9TKzKty0lTbprr0T28IeJ3wjk0T3oUyG2s7JLju0/K9QDbXNStw94IdTy0VKHgByPw4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dff3BK9q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dff3BK9q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB75EC2BCF4
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773930376;
	bh=EfYzODYTn0NTm+Mvi25JjdLYLxLuMewomF3tXPZzqjU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dff3BK9qblMvdaGnMX1CDzOnH6xEGROfjGr6QMMmkKcKL7jiomhG+5Fw/BDFAmJPK
	 xPUHtJhc+niI4/UoqiRzv/ppoiVu/XuEgVOyG7dWHdPmCWKBv0Y26L7XwSt6b5xHtg
	 glEa3utWOkxMiEE+QRQ0BL7aPsv0RSEHYxPF4p4afgzyfbVFiZhX/uzWC17WvEj2PW
	 ZbM++Dc1n9vxjq33XSgVnKNZ01bWq3a8hLRdoCFAW5nhn6I3ruLe+zr3y9KhQHP2CR
	 w1u8XKrFTRayqvzqdMQ1syFj4zKaT/mfb92PN/rSEKQZAtVbOFq2Aq7XXwVugOW3Cq
	 IaXoUwGxaV1cg==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad019bbd4so1146405d50.0
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 07:26:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxP691WPk3jzMFDWtWwZNTf6AEvD6TRx6waejztEjNiTlXg2ndcDMUN0yMr+aohw0OWsXxw7d6vjE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhvGrQJlI6O9F85KIGky0dBrhd2UFBL4ech0PrjPkTaRAOQwx2
	Ggf8kMgqpF9JRcmmH1BQWjod5wPIDpMJtUyaGz0ASjo599T62NQ0PLPo+OPz8YNzNEjnTT6m8qD
	qdz6YcLqZcGqSIjsmMaVDxjeIRVItq1M=
X-Received: by 2002:a05:690c:660e:b0:79a:37c5:5d29 with SMTP id
 00721157ae682-79a71db8246mr80698987b3.57.1773930375929; Thu, 19 Mar 2026
 07:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317082020.737779-1-ruanjinjie@huawei.com> <20260317082020.737779-15-ruanjinjie@huawei.com>
In-Reply-To: <20260317082020.737779-15-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 15:26:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLkpHbZ5rf=D+Az=XiWmDFOdD6MPjEVPBLCf820q1Jef4A@mail.gmail.com>
X-Gm-Features: AaiRm514Fbz_01wtqZJwa0U5dvzrhpy5vnegDsf7QhH81-s0mjNJm5JdcFU2cz0
Message-ID: <CAD++jLkpHbZ5rf=D+Az=XiWmDFOdD6MPjEVPBLCf820q1Jef4A@mail.gmail.com>
Subject: Re: [PATCH v13 RESEND 14/14] selftests: sud_test: Support aarch64
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, arnd@arndb.de, 
	peterz@infradead.org, luto@kernel.org, shuah@kernel.org, kees@kernel.org, 
	wad@chromium.org, kevin.brodsky@arm.com, deller@gmx.de, macro@orcam.me.uk, 
	akpm@linux-foundation.org, ldv@strace.io, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, mark.rutland@arm.com, thuth@redhat.com, song@kernel.org, 
	ada.coupriediaz@arm.com, broonie@kernel.org, pengcan@kylinos.cn, 
	liqiang01@kylinos.cn, ziyao@disroot.org, guanwentao@uniontech.com, 
	guoren@kernel.org, schuster.simon@siemens-energy.com, jremus@linux.ibm.com, 
	david@kernel.org, mathieu.desnoyers@efficios.com, edumazet@google.com, 
	kmal@cock.li, dvyukov@google.com, reddybalavignesh9979@gmail.com, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 9:20=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> From: kemal <kmal@cock.li>
>
> Support aarch64 to test "Syscall User Dispatch" with sud_test
> selftest testcase.
>
> Signed-off-by: kemal <kmal@cock.li>

You need to sign this off since you are on the delivery path.

Yours,
Linus Walleij
