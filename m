Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CF4171A0
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 13:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596B6C433C8;
	Thu, 15 Jun 2023 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837501;
	bh=t+2wC354QWhU+O19T6Rgik2yRjFWn188LUJeRwNUofc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K//TbDnohYFTagexGKtrRwrEcpN/jzaTeuXG/IgwXLO0tFsKSB2ekf1fUWY6laii1
	 vYKI1iTvA/ARANfsLZpZr7aOvHlfYkeWAUBIuWwYCfK2ttfbnKwyndrzncdYo89vro
	 BAJGpMo0u134UwgHdV2qEllY1Z6q1vL4Kgj5r2jpNTjGT82vFqrEgbRmD9qjCJpnt7
	 z6PQ/kSbZ7YMWix3F+oTjpvKZMT6XlxmIOmBrz7anElgNaPi4TqLcdIM/04sFPCNn7
	 3z3yjXZOyHFZlNrVM2Q0k/uu3KnO24RVabGom8+uR0ylXX29cFu/I2vOYC3NeIYd1t
	 uSO27Q++cW+YA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, YingKun Meng <mengyingkun@loongson.cn>
Cc: krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev, 
 loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230614122140.3402749-1-mengyingkun@loongson.cn>
References: <20230614122140.3402749-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v3 1/3] ASoC: Add support for Loongson I2S controller
Message-Id: <168683750003.557448.10961262618538846845.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:20 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835

On Wed, 14 Jun 2023 20:21:40 +0800, YingKun Meng wrote:
> Loongson I2S controller is found on 7axxx/2kxxx chips from loongson,
> it is a PCI device with two private DMA controllers, one for playback,
> the other for capture.
> 
> The driver supports the use of DTS or ACPI to describe device resources.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Add support for Loongson I2S controller
      commit: d84881e06836dc1655777a592b4279be76ad7324

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

