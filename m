Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540667;
	b=PU+P8XxFXLeAIBZTgsPiM7zioelPSlwyznSjaQWvuZ59B6L3bu8C9EKEzFS28n/cetYg
	 hX/gmjLuJfqJFOq4Mdf6BMJO3ppRNc0mEzLIpSGvGrNcownNx2iWeUDAcuFhM1GrNvDqw
	 jRHy6cCLBdveRj38HN8a0Z/VjZOipMoijLRPZh45QX5O04UrfIT8RhFIHjZ0NeWeWNZLl
	 pwUBu1B5YIBgxn28btEdIyTxib6KWoGTpdRNbwdLEbcKoBeAuXHmTv+G6/Oeh2Zo1GWLO
	 n4+hamdWmqGJAoCYdeetYLj9Vrglk22V94gNSxd8dAlHg7fQ8yMoQUkPb09OwwGokgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540667;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8g/Vm4O1rEWsEjj5TW0V+S131Vo2iWAqlSkIzIpnpdk=;
	b=NAOm8ES97xxYqDARMN73g3r2oj7efs82gYgm4T8tpZ7Pi9Ajb5gc34qSPTuz96WE2aB7
	 +lt7biYOPG1cCC0WBEX3OF/GeDjxNyWU2d3l4/kmEU/ghYZVMI40ZLDNSpM7TrsThr5il
	 GkYLNx4qCqFNxE95nTSe/SSYtCU45j/ziIJ6Bczc5+8G4KNHhP32OobTEHz+XbKe9UiFb
	 qAcknpY5tuckcWAiEoPh89ljhcQf+18IMdj/jN/UOGYi+BB2NdFuyCINkkW+BYMdOuvyJ
	 hqsLpQOKk9eHwmzyBBn9UM1zgY94WxgaEo7GqeD51fxC3d1b3qfN5YH1uygixxKh+hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNqnjne5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E9606A321;
	Tue, 24 Nov 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNqnjne5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EBC1F000EB;
	Tue, 24 Nov 2026 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540666;
	bh=8g/Vm4O1rEWsEjj5TW0V+S131Vo2iWAqlSkIzIpnpdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LNqnjne5/f65lSTK2EHGuwMzt9Q5apk0gatGUe3I1rUBe7pT7mqHIb8nfd7mbqbw5
	 6EehB5xeTVdT48q7RjeChj6k1rdci86f1pavdzAioG3yTNBFSAmvGdGsk9OhpgZfUz
	 ADJlnVzyD4utQAZ2zhaXjCYXMUlxihAmLYwK6rRuFSEQTu2pjiw7hvkgnJ72wvXTb8
	 MnGe2J6+j/Ti48JvM9aMo1zeL6asTw5Ej9uTQIoJjeSICQgGNBkGyy4MQM21OfZLcA
	 5LkmU/b4HvW89P/3OqXMkKoRnoW3v2C33CWwrGyJiJ8P+pXqKiz19epfKLYsiarvrq
	 h6UCGc8K7x/Cw==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, linux-sound@vger.kernel.org
In-Reply-To: <20261124072413.3282851-1-zhoubinbin@loongson.cn>
References: <20261124072413.3282851-1-zhoubinbin@loongson.cn>
Subject: Re: [PATCH] ASoC: loongson: Set dai_fmt for auto format selection
Message-Id: <179553036944.264265.14453578369983572823.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:26:09 +0000
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W5mecpkLSmd6cJfRbUgrBak2oNQOqMfqUpqEzESQHPg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZj21fsmxp26HmWkfn9+/Z/hTfTlo5yU0wr+ygyN170
 xhcVAtyO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRhhmMDHfj9hike/o/6dh+
 5HGiU1ynyaWsSYZ1Z/0K/y+1m51yu5mR4VJPaL9FpZ9+6pqbL48KHLZyMxaeKOL7S9Q6nmPyrQo
 hBgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Nov 2026 15:24:13 +0800, Binbin Zhou wrote:
> ASoC: loongson: Set dai_fmt for auto format selection

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: loongson: Set dai_fmt for auto format selection
      https://git.kernel.org/broonie/sound/c/279cd42031ae

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

