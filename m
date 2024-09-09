Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8888F5A;
	Mon,  9 Sep 2024 21:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919038; cv=none; b=tVVFeT6mFiuthbEEnCImPARC9THTpFDH5dSmZRWpYBK55kE9bOigQJLK03hxE3XNVghux+GSrjipkF0PTZp1lYs56R4IyK4mCTQNM7shbA8JjQro+E8O5j/+nSnv4UgoNCddzsFjLg7WsKz0tN5MfX+/D2dNNEP+Um3heDpWkuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919038; c=relaxed/simple;
	bh=DKfZsNl88hVK8eGO6BIRSHUTgJyd8NfJqLDhHgkxRME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q7kZMCS5dDrjs9OqRhTriJonJCtl9gzG+bHp3HU0sCTCkXZXteKKkjdDFGg4ZdrMyQbCTVhTSXhrxs+BIncTl7Dt8z3dm3Szd8/bqefKnHJv1t+emm18W39WiJ0iyYMEzsd9Fx4Uln7z5khXUx4WIanxVoyUkhu9CaxDW8U3EAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJNxVYx9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJNxVYx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93771C4CEC5;
	Mon,  9 Sep 2024 21:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725919037;
	bh=DKfZsNl88hVK8eGO6BIRSHUTgJyd8NfJqLDhHgkxRME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NJNxVYx9IVk6F0OWB29/N8KXh16vH0k9HVTUS3zAda+kZJ+cWIl1eTqVJpMZ0niqj
	 WRlw13LduYXXjv8PET3ZG3PqwG2L7xzxb6M8rPx563Lf8/zyrBl/EptTtsZj+jvzN1
	 gW2Pi9RAUZYduXIieSgmUIWtZ2UFrL53YZ7XcjNI/ukQ2wxNDxuvMUWp/Jh+T4F/6C
	 ayMASy7TjgaEKpFp1CY12WIQXv3PlxDsLN1UrSkMD9BVvJyCEdb/t447LkL9Bj0taU
	 TxGhN/hH7b0gFL7lQDfaHLsHVdWZg+sivZQdD+3nMfI7uzFGpcvxs3VURcXKSqYZ9/
	 h0hsrpq1JRxGw==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, 
 Tang Bin <tangbin@cmss.chinamobile.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 linux-sound@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev
In-Reply-To: <cover.1725844530.git.zhoubinbin@loongson.cn>
References: <cover.1725844530.git.zhoubinbin@loongson.cn>
Subject: Re: (subset) [PATCH v1 0/8] ASoC: loongson: Simplify code
 formatting
Message-Id: <172591903431.148496.16162581988774459514.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:57:14 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 09 Sep 2024 15:19:04 +0800, Binbin Zhou wrote:
> This patchset attempts to improve code readability by simplifying code
> formatting.
> No functional changes.
> 
> Original link:
> https://lore.kernel.org/all/c54fbc2582702689c005e1ba528ab2318b1adde6.1725518229.git.zhoubinbin@loongson.cn/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: loongson: Use BIT() macro
      commit: f2bd6f5b3777d800fb3cad17b9509e1e2128df62
[2/8] ASoC: loongson: Simplify probe() with local dev variable
      commit: ce3997ab8b4ae2312b8cdddd7db9b15eb11004a3
[3/8] ASoC: loongson: Simplify with dev_err_probe()
      commit: 3d2528d6c021cba141a7079ae1a5937190700899
[4/8] ASoC: loongson: Simplify if statment in loongson_card_hw_params()
      commit: e28ee1b8a92e6797fc652fa64e536178dd627e89
[6/8] ASoC: loongson: Replace if with ternary operator
      commit: c7b626a8930d7029c096f0634ae6169af59d92b6
[7/8] ASoC: loongson: Factor out loongson_card_acpi_find_device() function
      commit: ddb538a3004b10a04a14a0d275c5f52a8d161e80
[8/8] ASoC: loongson: Factor out loongson i2s enable clock functions
      commit: 4c22b04e116e114f18d9cef15f913e1649ccb7ed

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

