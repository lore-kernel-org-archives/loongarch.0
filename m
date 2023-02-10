Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1586B2F41
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 23:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCE9C433D2;
	Fri, 10 Feb 2023 23:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676072039;
	bh=iAF9W38J7qGv/XEwwo3TiiIU8PezgQlEmj3/XKmrSQ8=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=Jn6Iq4aFz6eNIuuI7xIfmLfDhBmXy1ZOkQuVayhTHUMm6np+AlRirqORoIFtypmMu
	 7pOW/+G3W6C3JZOCVztUK6lYFKZmqGexApDnuBR3/iq+gKKCWdpr0/ThnHQTnmI8On
	 PRN7qFSav1FxeGeQ4zbbV0LdoR4Gric/r1okGkChrTcYSTOpE3gE0POB1oZuB6m5Ll
	 em4b34NkGszK8lKLckAdAi4LGRv5cqqDRPJ1CV6komN+migumCiAkOeYAnAp/8313c
	 /h91rclNHHmpkbMTfmv55DaUbMJ4nGoy818tjywa9dz2U86b4bOX3QqXRkZEkwosxM
	 s5UFp5E9IkW2g==
Message-ID: <44842ac43c23c9cebfdb3b94ff3760d8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221129034157.15036-3-zhuyinbo@loongson.cn>
References: <20221129034157.15036-1-zhuyinbo@loongson.cn> <20221129034157.15036-3-zhuyinbo@loongson.cn>
Subject: Re: [PATCH v10 3/4] LoongArch: time: add of_clk_init in time_init
From: Stephen Boyd <sboyd@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Yang Li <yang.lee@linux.alibaba.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Date: Fri, 10 Feb 2023 15:33:57 -0800
User-Agent: alot/0.10

Quoting Yinbo Zhu (2022-11-28 19:41:56)
> The Loongson-2 clock controller driver used CLK_OF_DECLARE to
> register clock subsystem that ask of_clk_init was called in
> time_init and this patch was to addd such support.
>=20
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
