Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F277522A
	for <loongarch@lists.linux.dev>; Mon, 19 Jun 2023 22:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5353CC433C9;
	Mon, 19 Jun 2023 22:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687213749;
	bh=ggV5dGReqx2CliDuDBzcUnnMkrhUzkfRPwClhzbhVKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vCCGNyLwcD2Q6aYvYVAWKyAnoJsB4XA/dYqVxVMXvCeNGoseF7jZqzcund3FFm8II
	 HvDyk3iCK91pwL/Ywna/dzFaUwMF2TP8XUwQHYGknkwnqMo24mPiIAosKsFPklAyOJ
	 s1NTYXaA/3ds3eStCyydZmMpMgr8kWm+hh4ka2QxQ2w/O3ODBX/r5HnjrxY9kese5m
	 EJhImTmdgNwJ51f5L5VsZ/nRN3uAiB5hf4G5v1p3NBDqiwJbhsaTWIRG9Wdjbilz5Q
	 AFXCraWWjg9uwRgVHFCicg22UBywsVhOeji8JEFnqnQZixlcodqTyHSU0GM/P0dvgV
	 SOe/SCbGvP/eA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, YingKun Meng <mengyingkun@loongson.cn>
Cc: harshit.m.mogalapalli@oracle.com, krzysztof.kozlowski@linaro.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230619074649.3608726-1-mengyingkun@loongson.cn>
References: <20230619074649.3608726-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v1] ASoC: loongson: change the type of variable irq to
 int
Message-Id: <168721374806.200161.17284971848100516046.b4-ty@kernel.org>
Date: Mon, 19 Jun 2023 23:29:08 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835

On Mon, 19 Jun 2023 15:46:49 +0800, YingKun Meng wrote:
> We use variable 'irq' to store the return value of fwnode_get_irq_byname().
> A negative value indicates that the operation failed. If the type of 'irq'
> is unsigned int, we never know if the operation failed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: loongson: change the type of variable irq to int
      commit: 1650e8a8818d516219b2c0cbc203f53cc6cd77a0

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

