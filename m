Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA1AA959;
	Fri, 23 Jun 2023 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1687539640;
	bh=6rmpokyTm1820Gky7UqivAdAm5uBlKSdZ2K2AKHvsoo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ELkuyH9EaOux9JN8Rzhe8b55zb5ry82dafuzWG1B32tILizw1CfgU+XgRTyd9E2se
	 8cNf1bTtjKFLsmP95eo/lRh0PFXNteJP5340qiSs/23bQb26RdpANzxlCSyAHyfDA/
	 xDyn0+MD4p1QKDjDMRiGC6zUuZphCej3sc5vYjjo=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id CEA0E65DB9;
	Fri, 23 Jun 2023 13:00:38 -0400 (EDT)
Message-ID: <22d794613f70b04544e39e8861737af09365ae8a.camel@xry111.site>
Subject: Re: [PATCH 7/9] LoongArch: Tweak CFLAGS for Clang compatibility
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>, loongarch@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org,  WANG Xuerui <git@xen0n.name>
Date: Sat, 24 Jun 2023 01:00:37 +0800
In-Reply-To: <20230623134351.1898379-8-kernel@xen0n.name>
References: <20230623134351.1898379-1-kernel@xen0n.name>
	 <20230623134351.1898379-8-kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-06-23 at 21:43 +0800, WANG Xuerui wrote:

> -cflags-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
+=3D -G0 -pipe -msoft-float

-msoft-float should not be removed.  Our consensus (made when I was
developing https://gcc.gnu.org/r13-6500) is -mabi=3Dlp64s does *not*
disable floating point instructions, but only disable FPRs for passing
arguments and return values.  So w/o -msoft-float (or -mfpu=3Dnone) GCC is
allowed to generate FP instructions everywhere in kernel and it may
cause kernel FPD exception in the future.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
