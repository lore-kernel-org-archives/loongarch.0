Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7A4A48
	for <loongarch@lists.linux.dev>; Fri, 10 Mar 2023 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1678437201;
	bh=H1uDGv8j82PG/omXA8I5l9seIgQwaVUrcBDhFnOLxWU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=R2lMO64b77mU3PTHDWfsWlz2g0/ciPQqjizfI8Oq2Nr5qlnw/AQpbzxAjxdYOuq17
	 Ahjz4a7h4Z78AH4dR6uVZaCE3LGpVOkey6OzX0/Qm9CW/KGQ7Su/Fi8BkkfivuNC17
	 RFfWU8lrfpK6tC77jLZBAbcjG+uuS2js2/te99rM=
Received: from [192.168.124.9] (unknown [113.140.11.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1806165A8F;
	Fri, 10 Mar 2023 03:33:18 -0500 (EST)
Message-ID: <037d7f13866e03dd2cc0dd4307479fa9a7498b19.camel@xry111.site>
Subject: Re: [PATCH V4] LoongArch: Provide kernel fpu functions
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann
	 <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org, Xuefeng Li
	 <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Jiaxun Yang
	 <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Fri, 10 Mar 2023 16:33:13 +0800
In-Reply-To: <7e743095-3dbc-3f28-a347-d2a1659e650d@xen0n.name>
References: <20230310025136.964745-1-chenhuacai@loongson.cn>
	 <7e743095-3dbc-3f28-a347-d2a1659e650d@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-03-10 at 14:33 +0800, WANG Xuerui wrote:
> We should probably provide more archaeology or legal evidence as to why=
=20
> the in-kernel FPU ops must be GPL-only. After all the status quo is that=
=20
> among all arches that provide such ops, only the x86 ones are exported
> GPL, so if loongarch should go GPL for this interface then probably=20
> everyone else should too. It's not only affecting loongarch IMO.

If it's forced by GPL we should change the other arch's similar function
to EXPORT_GPL immediately.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
