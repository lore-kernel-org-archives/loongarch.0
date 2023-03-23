Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4016320A
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1679560630;
	bh=PjxbSY6yi7ZNQXlE3B7UUBHO/KycZX9tiXUgoS/6TkU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=j4ud3VZsTrJ+FNGpECY4/jFR+4se0tO6XKUT0YGll8Wv550HVdFnkQf03Omd423qH
	 pIUNFwhBqPNXGITBprfdg0znVH5K0RsOY8EjggYAU3ctcuCBGMKJYDBCcSbw4KslyY
	 m3m7N54NY2Z9HcDJGsXm0jcpDp9LLTTO/YPW0ulc=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 245C265C28;
	Thu, 23 Mar 2023 04:37:08 -0400 (EDT)
Message-ID: <a4def33dc74f5e384f32af970c3c0cef2dd72ab0.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Enze Li <lienze@kylinos.cn>, 
	chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Thu, 23 Mar 2023 16:37:07 +0800
In-Reply-To: <793a6d0f-fc79-ffd4-856f-9dff6e431352@xen0n.name>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
	 <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
	 <df8b7ec01580cb1ea825a409b53155121f44754c.camel@kylinos.cn>
	 <793a6d0f-fc79-ffd4-856f-9dff6e431352@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-03-23 at 16:32 +0800, WANG Xuerui wrote:
> (I had talked with Huacai about the field keys but the conversation was=
=20
> private & in Chinese; I was actually proposing all-lowercase keys but he=
=20
> insisted on "mhz" being "incorrect", then as a result he had to Title=20
> Case everything else because of *aesthetic reasons* which I didn't and
> still don't agree with. I later criticized him because he left=20
> "processor", "package" and "core" lowercased, but he never gave any=20
> satisfying justification nor backed out the change, so as a result we=20
> are left with the current situation. You can say anything, but as a=20
> matter of fact, the ship has sailed.)

If I read some comment in linux.git correctly, it seems the code
calculating the number of processor cores in Glibc would blow up if
"processor" was changed to "Processor".

To me it's a mistake from day one making all the userspace parsing
/proc/cpuinfo, while it's clearly more "human readable" than parseable.
Perhaps the "correct" way is adding "/proc/cpuinfo.toml" with a well-
defined spec in Documentation/filesystems/proc.rst.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
