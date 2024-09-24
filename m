Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5076E186E3A;
	Tue, 24 Sep 2024 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220398; cv=none; b=riuglARmg0ASKGuWxNlSTmjVJh2R+MvR2lPQWsMuj7Ww6kZLkxEYb6H0cUuHgx2Yqy5fpDYrd70PJVd+Qkh0g7QhWcIQXSyHATb/cUWN+I93tYpwCyPzE/Kndt1JkuaLHzaUOOEp0TXk8vD/njE1HMbyZS5jgP8d12/9hnOd+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220398; c=relaxed/simple;
	bh=I6brExxkWBVpJkhSehQuLcd8T40xvKS1pot9Nh/Ly/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJUoWWGCPAj+m338sIx4GWX4epAZ/GyJHweTO2tuF1GDe1+1sX2fKQKKPLHltAldKY6zy+fyp0a5Ptqq2M7dWSl97gjSVuH7/laYnQW7bsTt2/KODSBgPzCAo6N8Uh4oT0CdyMxIf2JBBV9SyYovh0dVc8SiFiGCXPVaMxMWNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEPE6z+0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEPE6z+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017DFC4CEC4;
	Tue, 24 Sep 2024 23:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727220398;
	bh=I6brExxkWBVpJkhSehQuLcd8T40xvKS1pot9Nh/Ly/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEPE6z+0cd7mCPScA1J5PEjfaXYS1Ay3aK4LJXSoXQUqv/LgBQy5a3K5ABp3rSjiI
	 kLvKqc5NuUq8ZgXrH09s8D6mJJjtJcSFv4aSJdejJFVz8kdLxNGKftEIiPGglZGD7+
	 PcLFMPWLIa/s9HZZF7tU9by1fI7c/832RdwjGLeAjUlLTFR7WyqIHltKPWp2HWTmN7
	 WovhIurSmeBT7tSTmJx7MhyrJpLdYPbks+tU7Zj0vL0rw4xCgmYffwK6cGdBlHoz3R
	 ufeEx/5AZjwvibAkXmxgUphbhfUMuYNnjijcNieO0oadap+Df/kLKK0zs9ciYZBvLS
	 2LUQCn6xt9hBw==
Date: Tue, 24 Sep 2024 18:26:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shuming Fan <shumingf@realtek.com>, Mark Brown <broonie@kernel.org>,
	Daniel Drake <drake@endlessm.com>, Xuerui Wang <kernel@xen0n.name>,
	devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>, loongarch@lists.linux.dev,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 1/9] ASoC: dt-bindings: Add Everest ES8323 Codec
Message-ID: <172722039635.568388.13431023710025552350.robh@kernel.org>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
 <4269c4bea71230c8145ac6fa5a5881d252b75ec9.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4269c4bea71230c8145ac6fa5a5881d252b75ec9.1727056789.git.zhoubinbin@loongson.cn>


On Tue, 24 Sep 2024 14:59:50 +0800, Binbin Zhou wrote:
> Add DT bindings documentation for the Everest-semi ES8323 codec.
> 
> Everest-semi ES8323 codec is a low-power mono audio codec with I2S
> audio interface and I2C control.
> 
> Cc: Daniel Drake <drake@endlessm.com>
> Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>
> Cc: Matteo Martelli <matteomartelli3@gmail.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  Documentation/devicetree/bindings/sound/everest,es8316.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

