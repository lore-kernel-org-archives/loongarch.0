Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBE51AA65
	for <loongarch@lists.linux.dev>; Wed, 26 Jul 2023 18:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8062C433CA;
	Wed, 26 Jul 2023 18:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690394888;
	bh=KO0tIMLitvfXftP7jSQ/L62zjhqU48WJy/n+V/puLKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gf2kiogqhk9xD6i+f8pcoaUXIIv8mEMpuV4qncLXGJOrpiBcmVgRlIQnv8RrWuSwY
	 vxP+FOgR6ii1DRmSGgU7bE/5Y+TUEvoMtW/HtegshUCf5rwxqvwdF518VUct+QPQfH
	 F90puWwb6gPm4NsCsYVyaW49T5Qo0Qh1BhkmwsAxh9oRO+QBIFsyQPcA6UgO9MlhJU
	 C/K/O6QHJC0CCq3R0o2gIoYgXddbrAo5TGXI8sxG45yQJ//T5AkXnxpCcHrM8t6y6O
	 y2Bu79IQ3K8Iws/MLLbevfC0b8NkZvjMoxP+UFt6ZbxcDT6FSXFkE1dHmxcwJiVHxK
	 NdxFKDAL1rtog==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, YingKun Meng <mengyingkun@loongson.cn>
Cc: krzysztof.kozlowski@linaro.org, xry111@xry111.site, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 loongson-kernel@lists.loongnix.cn, kernel test robot <lkp@intel.com>
In-Reply-To: <20230726110516.703342-1-mengyingkun@loongson.cn>
References: <20230726110516.703342-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH] ASoC: loongson: drop of_match_ptr for OF device id
Message-Id: <169039488645.108395.10654642957038470673.b4-ty@kernel.org>
Date: Wed, 26 Jul 2023 19:08:06 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9

On Wed, 26 Jul 2023 19:05:16 +0800, YingKun Meng wrote:
> The ASoC Sound Card driver can be compile tested with !CONFIG_OF
> making 'loongson_asoc_dt_ids' unused:
> 
> sound/soc/loongson/loongson_card.c:200:34: warning: unused variable 'loongson_asoc_dt_ids' [-Wunused-const-variable]
> 
> As krzysztof advice, we drop of_match_ptr so the device id
> can also be used on ACPI.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: loongson: drop of_match_ptr for OF device id
      commit: c17bd30d0ba5ca59266771cdfc387f26271a7042

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

