Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB7D13CA86;
	Thu, 11 Apr 2024 07:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820576; cv=none; b=sJ+UG7wqb+CHKHKQpwPuBznxJ9eMhSw2bYE1dEIf5AcM+s6o97AqPaY8A+30/c2+xBtrpL2zV4BGyGn/aa1P5KReynACwjPygSAzaYO8XAnbORRIcwumXE5T4I5bwsXS6KMSVyw4Nb5Z3CDi+5vDl0wqb2B8PxqiVN6khBNHebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820576; c=relaxed/simple;
	bh=E+/jWhIHJgSqC38iIB9OuMYrZJBvWRHS7S0LY+XOF+U=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=hJEtr4kLv4Gr/I1rVemo2wcOMKMQtWjHep+r6aed+LWp5/WSlMMAXX/QmGCU4QFMp3S18XSwO1GmiNTK1qWNnVYVAW2YJQwCaNyeNpikATTKwQJh1pFvp3WxNiAiUNCtC/4f1eowxSaiS4ZZ8vBKc1vYKUAG/uvXzLBxv76NC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0Hh+jun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0Hh+jun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07038C433F1;
	Thu, 11 Apr 2024 07:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712820576;
	bh=E+/jWhIHJgSqC38iIB9OuMYrZJBvWRHS7S0LY+XOF+U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=P0Hh+junsqeAbWlt7QOcgH6tNr3t6bzrPkbeyjXi/2Jjscw3YC5MxJfDxoWG2dIYk
	 VdiTCXy0WcZmqsE3aGfRc4s5knxzycjIwYowIT3+z1WMLgHpPwVdY+C7LbuhvhIxC2
	 FR3mQUfBfWxq4iSHfvjULQSQ23DPYVVpfYe1fWvZocAZuvA6+E/WP2Pb3iacyEpQZL
	 wUbUxds7nCgBNf7mwgH8j/BvyXgkX59bXNNhOaMuHmsNL/zT91P7ZffyR2nMN40YO1
	 /Eicc07Jt8sOucmYCx5SWKB/lp7ddljchHMeK33+mxUPTt3spPO7rUttqcVe78Mmlr
	 oS2pSajh3PEmw==
Message-ID: <20a465e52b87733cb697463cd421e259.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4820325406aec322ae7c062e2b03437d0c95e820.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn> <4820325406aec322ae7c062e2b03437d0c95e820.1712731524.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 5/6] dt-bindings: clock: loongson2: Add Loongson-2K2000 compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Thu, 11 Apr 2024 00:29:33 -0700
User-Agent: alot/0.10

Quoting Binbin Zhou (2024-04-10 19:58:32)
> Add the devicetree compatible for Loongson-2K2000 clocks.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next
