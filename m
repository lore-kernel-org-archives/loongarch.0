Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC520F0
	for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 06:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1681194104;
	bh=eVnY1kjH/ofehDpdMAtkqUmPwETHEUX9WhBgW4u0MOk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XgCO1SdV5+rD4cuOtwSRDHjPNGvJ8q7SFSAWArLuD5QB8OfARC82x0qe7n/DW+gZ3
	 XOqc/6D2PmJvR9aSkB59ILuD4N4euCOgjXzbimbmQqryJ8KXOAnOFMkwF2DVGTcVgF
	 yTqr9H64MIBnL468FwnxjAWSHnCo5SsikN3qZTF8=
Received: from [IPv6:240e:358:11f1:2100:dc73:854d:832e:6] (unknown [IPv6:240e:358:11f1:2100:dc73:854d:832e:6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 0138466497;
	Tue, 11 Apr 2023 02:21:37 -0400 (EDT)
Message-ID: <24484e693147283d11bffe286ca1bb974df7db42.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Improve memory ops
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Rui <wangrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Tue, 11 Apr 2023 14:21:31 +0800
In-Reply-To: <CAHirt9hMbQcq34Dgtc5u3=841_hzjUc4TYiEbhchZO=jkCvbVA@mail.gmail.com>
References: <20230410115734.93365-1-wangrui@loongson.cn>
	 <b80e083baa49f0443abee66eb888fac920f66e79.camel@xry111.site>
	 <CAHirt9ib2LPXMbxb+UCJB1MsBnUuWNLb5+uyqcR5Wiw2fsJi6w@mail.gmail.com>
	 <8aeb6d8dc4cbe8c992b69d75d8953d59b71a2c38.camel@xry111.site>
	 <CAHirt9hMbQcq34Dgtc5u3=841_hzjUc4TYiEbhchZO=jkCvbVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-04-10 at 23:52 +0800, WANG Rui wrote:
> On Mon, Apr 10, 2023 at 10:36=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> w=
rote:
> >=20
> > Hmm, yep, GCC does not take the advantage of -mstrict-align expanding
> > memcpy etc.=C2=A0 I'll add it into my TODO list for GCC 14.

Technically, it takes the advantage but not very well.  It's now
https://gcc.gnu.org/PR109465.

> Great! It looks like you already have some good ideas, and I look
> forward to hearing your good news.
>=20
> Rui
>=20

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
