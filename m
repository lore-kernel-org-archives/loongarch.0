Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846C1F8933;
	Tue, 14 Jan 2025 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882065; cv=none; b=VNAsHeOQw60/9ZNJPnOz/yplP/mNBHFEInKtEMK6LQM6ZUkB/PNuAqKVCxEdnsEG0TewKU8IcwLuSpvQlh56xZIWRWnSOPc3IapTSk01mwDbwDXpQvF1YllQR5BAj10K+RInKuPEhThYZ7HYh4X3Ug25eYhl9kZpojqr0ucpXZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882065; c=relaxed/simple;
	bh=45vAiy+WoDiWDG1r/iJ2SDci4hnscjPltHSpdxct2Ls=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=qxKdKGP8jLDezr5USWcNqlgUOm0wKgnBws3iBkcX530lFwhLZpDfkEA3roJNXXOLHIUwGtnLVw4wUi4qMwSYjfOcIk/VQfB5+TjOwxX/AJyZz1Lxi1HACY0GRCisMCzMixn7r0zpHRuC7UTkZ74zOlg0oIdF3GW3K5BSCa5thsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/hPiDQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/hPiDQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7ADC4CEDD;
	Tue, 14 Jan 2025 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736882065;
	bh=45vAiy+WoDiWDG1r/iJ2SDci4hnscjPltHSpdxct2Ls=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=o/hPiDQ9cBG0TFxQn7gx0H9KJyK9UfepzaJ2Vg0tczrTTZcN/MdVQ7bFtCNv877a/
	 BThyNzsEYBf96vvt7ZMDN4GAK/18iyqpCKgTGTRBiiKpwI0mCo/GXQmWOrcDdfAROu
	 QJVFhEnyhotv8zkAhWbxReQcQU+u+0E2z2OlHCzmZwy3JP8ogisjGc8weIKT0G2Wmu
	 SydEFg4zhDvc5gDXCl4zBYaaseSGPKa9LvnMJeieBKvSqmJJvvp3vOYWrcwlDS7JEy
	 w8+W+4tWNtVZb0k3ovd9O9ui0IZzfzpOmaxGeWLrkiQhtHdMqMIGcub8CZqyx+2Vq9
	 gDFePmEBfbcjQ==
Message-ID: <faec889d5d2f91d1477b2f2ba1457fb3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8733a7485619bdb791de25201a3d7984d1849c9f.1736856470.git.zhoubinbin@loongson.cn>
References: <cover.1736856470.git.zhoubinbin@loongson.cn> <8733a7485619bdb791de25201a3d7984d1849c9f.1736856470.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 1/2] clk: clk-loongson2: Switch to use devm_clk_hw_register_fixed_rate_parent_data()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-clk@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, Michael Turquette <mturquette@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Tue, 14 Jan 2025 11:14:22 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Binbin Zhou (2025-01-14 05:00:28)
> Since commit 706ae6446494 ("clk: fixed-rate: add
> devm_clk_hw_register_fixed_rate_parent_data()"), we can use the
> devm_clk_hw_register_fixed_rate_parent_data() helper and from then on
> there is no need to manually unregister the fixed rate hw.
>=20
> Since clk_hw_unregister_fixed_rate() was not called before, we also fix
> the memory leak that was present.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Applied to clk-next
