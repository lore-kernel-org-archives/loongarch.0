Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE19168C7
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 13:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA14C433C9;
	Thu, 15 Jun 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837504;
	bh=VjrxKNUyqqwfgs3hDcEiMErb77PH5mLOvHSL73d2Y5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V1NmSeYQXyDn8JX9Jp6wW564xLTgGZTxqBQAilml//XfEd2bfLiadeT81HcJdIDLP
	 vJk4hiheeqlaIN5zIl8QjM6dgjr4RpFbZzaVUf8vMLYTMKdSmTyf3o2rCVWIjYlm6V
	 gHQEXpmXX3ucAZ4cBveVspOXrjXEZOql/MtBjV73JMC+dSMUT3NHsavWzcJ2yT67s4
	 ACJdt8BlkZVMTNBAzuHtq7ccQMJx9aNYsme2C5/fewP4e6zf9Osmj5Q72Qol3p4POj
	 WQXrHyuANYmYP6o4fnUmDt5HjlvlXl/kNW2fFfFGf+tsP3FiYauhekRMyHNTfcfd7f
	 TRzPIeS4RBqcg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, YingKun Meng <mengyingkun@loongson.cn>
Cc: krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev, 
 loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230614122240.3402762-1-mengyingkun@loongson.cn>
References: <20230614122240.3402762-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v3 2/3] ASoC: loongson: Add Loongson ASoC Sound Card
 Support
Message-Id: <168683750214.557448.6898111686510406347.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:22 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835

On Wed, 14 Jun 2023 20:22:40 +0800, YingKun Meng wrote:
> The Loongson ASoC Sound Card is a general ASoC DAI Link driver that
> can be used for Loongson CPU DAI drivers and external CODECs.
> 
> The driver supports the use of ACPI table to describe device resources.
> On loongson 7axxx platforms, the audio device is an ACPI device.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: loongson: Add Loongson ASoC Sound Card Support
      commit: d24028606e7642261d33ad2a50aed940d35cfb66

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

