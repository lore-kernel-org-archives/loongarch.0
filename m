Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AAA7B
	for <loongarch@lists.linux.dev>; Fri, 10 Mar 2023 02:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E48C433A7
	for <loongarch@lists.linux.dev>; Fri, 10 Mar 2023 02:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678416386;
	bh=tI+aEFnT7+/8bODwsopD97PexndTCnj+r/uQzEYXO3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g6TPom2jgLg/IsivODAprFgWauBuwS0ILv24MiYSs3eR6VHJ9fQfDIWIag2/Odoa8
	 8lMzdPBDfc9GB87o4+z1/9qhBVU96fNYIDZzX3o5m/3enoYkTTpSJCORg+74d/ZolB
	 q5qR2rg8fOwqqehZoGcQJso4hFkfW5GCsroFw56TPSByE3p5/R/q8vDczQPV0XbrGd
	 pjnCqBI8n+uBiGVSwbQ2QMhwmf2slTfrvR/bxs/lbX6hMlFYSJd3Oz67sexSYGg5Qx
	 VjxONTZHwl7rAgPGCeJKAkcvrGsa8RGra/1cTIfrXZogPEo+XwbpwtPSyQnZ1xjgkN
	 kw8VIX9WQVjSA==
Received: by mail-ed1-f53.google.com with SMTP id s11so14970441edy.8
        for <loongarch@lists.linux.dev>; Thu, 09 Mar 2023 18:46:25 -0800 (PST)
X-Gm-Message-State: AO0yUKVvbEw49YuQkH+TFqh3P0NWNN9dTsySuRkN298UFtNiXMhKOwcB
	Ew0bMPuah/DHyv19iIl8PZqmu9VuV1RrI+3KQNw=
X-Google-Smtp-Source: AK7set+RD1QtbOMZlvn5OyHmt5ba3zcRlj6C4U+McRvpbPwgqFpd6db/4zp+mwCWLmL/ZXEG05KXDe+Y5x+qVoVuDog=
X-Received: by 2002:a50:d543:0:b0:4af:6e08:30c with SMTP id
 f3-20020a50d543000000b004af6e08030cmr386406edj.4.1678416384101; Thu, 09 Mar
 2023 18:46:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230306031258.99230-1-chenhuacai@loongson.cn> <ZAoNPuyHQTqucYxn@infradead.org>
In-Reply-To: <ZAoNPuyHQTqucYxn@infradead.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 Mar 2023 10:46:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7rms0X=V7fFDRh7KQWamwevvY4fHAEEuzSrQNUgVX0Ug@mail.gmail.com>
Message-ID: <CAAhV-H7rms0X=V7fFDRh7KQWamwevvY4fHAEEuzSrQNUgVX0Ug@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Provide kernel fpu functions
To: Christoph Hellwig <hch@infradead.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 12:45=E2=80=AFAM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> NAK, this needs to be an EXPORT_SYMBOL_GPL.
OK, let's make it GPL again.

Huacai
>
> Also no way we're going to merge this without an actual user.
