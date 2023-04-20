Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372EB3212;
	Thu, 20 Apr 2023 18:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1682016145;
	bh=4yVWvO8BQ/6PBStd+8MQaY8Kxod8dEo2U8LZzHQ5A4w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WAuJpyu0eWvSHFooaQNEhCn3+SWSYsMjBpsZlZxgctcPkb4bXno705LZyK63EyK2T
	 3X1itPJ5aZEhg4zw8esmaCQZeCLorxTTg5V7Ag5EP4ZplJRB1B+ahGmNlOP4TEYNQb
	 IfNh3s3GCgpbXIQSSvAj9BdifTCacXkMMka+eVvE=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1E25666128;
	Thu, 20 Apr 2023 14:42:23 -0400 (EDT)
Message-ID: <c91beae684ba1f45d22be1f3d8542c89711df6a7.camel@xry111.site>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
From: Xi Ruoyao <xry111@xry111.site>
To: Nick Desaulniers <ndesaulniers@google.com>, Thomas Bogendoerfer
	 <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Huacai Chen
	 <chenhuacai@kernel.org>, kernel@xen0n.name, loongarch@lists.linux.dev
Date: Fri, 21 Apr 2023 02:42:22 +0800
In-Reply-To: <CAKwvOdkZA6DVCbgF=P1xZcHiyGFTnYvGReJZTzVnmeZdsH0L3w@mail.gmail.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
	 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
	 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
	 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
	 <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
	 <20230419221500.GA17797@alpha.franken.de>
	 <CAKwvOdkZA6DVCbgF=P1xZcHiyGFTnYvGReJZTzVnmeZdsH0L3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Nick,

On Thu, 2023-04-20 at 09:32 -0700, Nick Desaulniers wrote:
> Separate question to Huacai, Wang, and the loongarch list; I know LLVM
> landed the Loongarch backend recently; any idea what's the status of
> building arch=3Dloongarch with LLVM=3D1 (linux kernel)?

AFAIK there are some issues not resolved yet:
https://github.com/ClangBuiltLinux/linux/issues/1787
--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
