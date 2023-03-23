Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471C28E8
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1679558647;
	bh=Hie7q1pLgYT2MtugWIUje/ntgP5ImVGjzSD2jrECzP4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gxjgsiPoRk8PD/ePrEP+6/Jynp8sX3ITtP0M18rYz8pg0BeKiZAlRcV0QNbIdERpL
	 pLydeeBZW75Mwk0E0IVKu/QCQ1JlKesR9+U8edI60hptBdmc7xt6U22CXIwYZBRf7q
	 C0zeGMp5lj+Dq29Vh/bPZybqnlDG/5cb/UeqkV2k=
Received: from localhost.localdomain (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 044A565C23;
	Thu, 23 Mar 2023 04:04:06 -0400 (EDT)
Message-ID: <02360140686b6cc74ea5b48207b639fd64a29365.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Xi Ruoyao <xry111@xry111.site>
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org, kernel@xen0n.name
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Thu, 23 Mar 2023 16:04:05 +0800
In-Reply-To: <ada9e89a70c6435cc7a832718a7b9b0f10d56fdd.camel@kylinos.cn>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
	 <3421f5632586b932bd05df1021290ed7def2fe18.camel@xry111.site>
	 <ada9e89a70c6435cc7a832718a7b9b0f10d56fdd.camel@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-03-23 at 15:05 +0800, Enze Li wrote:

> > If I read lscpu code correctly, it also matches "cpu MHz" (instead of
> > "CPU MHz"), "address sizes" (instead of "Address Sizes"), "features"
> > (instead of "Features"), "cpu family" (instead of "CPU Family"), and
> > "CPU revision" (instead of "CPU Revision").=C2=A0 Maybe you want to "fi=
x"
> > them as well.
>=20
> I didn't notice the "issues" you mentioned, so it remains to be seen if
> they are "real" problems.=C2=A0 However, I think changes like this should=
 be
> approached with caution, and we should refer to the official Loongson
> website's distribution versions[1] (which are widely used) for
> guidance.

Not found the link to 1.  And again we should not refer to the
"official" Loongson distributions for kernel development, at all,
because the commercial distributions are *fundamentally* incompatible
with the upstream kernel.

> > But this is just strange: both "CPU" and "MHz" are some sort of
> > abbreviations ("Central Process Unit" and "Mega Hertz") so why "cpu"
> > should be lower case but "MHz" should not?=C2=A0 And why "CPU revision"
> > but
> > "cpu MHz"?
> >=20
> > To me it's a util-linux bug.=C2=A0 Can you report it at
> > https://github.com/util-linux/util-linux/issues=C2=A0and let's wait for
> > the
> > response from util-linux maintainers?
>=20
> Also, I'd like to know why the LoongArch architecture is different from
> other architectures on this issue?=C2=A0 If this is a bug, then all exist=
ing
> software that uses the 'model name' field will have this bug for
> LoongArch.

Only arch/x86, arch/ia64, arch/arm, and arch/x86_64 provides a "model
name" field in cpuinfo.  arch/ppc and arch/sparc use "cpu" field instead
of "model name" and lscpu accepts it.

If some code only matches "model name" and it blows up when the matching
fails, it's definitely a bug because the code is already broken on 19
Linux ports out of 23.  It's 19 out of 23, or 82%, not loongarch alone
out of 23.

> This will require all maintainers to adapt to LoongArch (by
> adjusting it to be case-insensitive), which will unnecessarily increase
> the difficulty of adapting to LoongArch, won't it?

Yes, on the day "Model Name" was written, it was an unnecessary
difficulty and we made an error.  But once arch/loongarch is released in
5.19, it becomes a necessary difficulty.  If we just change it now, it
will be another error.

It's just like we all know implicit fall-thorough in switch-case
statements is a design error, but we cannot just change the compiler to
silently add a "break" before all "case".

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
