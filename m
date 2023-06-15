Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD7168C6
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 13:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBA3C433CA;
	Thu, 15 Jun 2023 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837507;
	bh=HDfK6TZ6p1z9konXBYN4xiV7FVSWRCnUgThCTPlpODE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MijxV188M3NQstbEsPBKj+rQV+7WTV0//Wbr3a4d9hw8Uh4EqXOfg6QCDXnAbBL3w
	 +pAhyiO0Nd5YMsZFl9bhjk0PQDxIxAWDXbE+BhfykWcGOwQ8DNQQ/Md7bB9BirALm8
	 UGFWqGhWUmu/KeTaAjC0+hOdgJ8A0F0Ygzh7ZPkV81o3IxSnB+foK4J0l78ccT1KjQ
	 yJtEqC3LtEmWDIbFo1IHk8it1Rh+JUSK+oIbMePCKvnQtwP1Irr2hBe17qwVe8U1kP
	 N/9GukHMt5b9RS/sLbuKqTNkrLStQp8A2nVjbO7weAdBsWLYqVjVDSx9DjqSUDgm9g
	 pivHGmCjswPKw==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 conor+dt@kernel.org, krzysztof.kozlowski@linaro.org, 
 YingKun Meng <mengyingkun@loongson.cn>
Cc: devicetree@vger.kernel.org, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230614122659.3402788-1-mengyingkun@loongson.cn>
References: <20230614122659.3402788-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v3 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-Id: <168683750444.557448.16842931306884549608.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:24 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835

On Wed, 14 Jun 2023 20:26:59 +0800, YingKun Meng wrote:
> The audio card uses loongson I2S controller present in
> 7axxx/2kxxx chips to transfer audio data.
> 
> On loongson platform, the chip has only one I2S controller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: dt-bindings: Add support for Loongson audio card
      commit: fadccca8f33959857948e279045a3757b5f21d55

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

