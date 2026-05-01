Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D750D316192;
	Fri,  1 May 2026 21:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777669864; cv=none; b=RopFzqE7HzygaadiRcImzg6fhtI+ZYUvVV21Wwf5OQJrv1IJ+Xkb3FCBtrnQOL9bAs+a4nPyUonAfQAICJpBKX4Z1AL3rt46XJGx3YkWO5BlM3NwQCoN2VGQ/1jN/UCbVaYkAE/7tX7njVa8euJYtz6zJ2a+7G+RHxtvJMOfB3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777669864; c=relaxed/simple;
	bh=7NrCLfHiSyMi92eTKRzZ/y+I0FTaYJDj7gmP3R0+aXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thdBan4EjB61XbcypBNxI9ZqhUllzJ5At3CUl99IjQXDsdcIIXKaOLbex5t9D7l8wvCUQwPPyMSZW6/I85qLwwsT2G7ARUWpD98zXbIuZwseuyvAG5RorAMo4SUkfAcFhuFKD3D5V47/ovbgikPRKu71yuf5Abktzo9tKMOPKAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilU9xnWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilU9xnWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B97C2BCB8;
	Fri,  1 May 2026 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777669864;
	bh=7NrCLfHiSyMi92eTKRzZ/y+I0FTaYJDj7gmP3R0+aXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilU9xnWxqfV/JP7lha7zu0G4Z1vIIDEELCKQfF/OU3g7W+TkNQafCfHZm8LjEG1Bi
	 BdcKRI1hL0fn4fXPc6QiBxehVZhPRnYc07MqXpawT/cDocABjIxXAq4HJuep/Q7aOw
	 JCgAk8t+cORRzLxXuc8eM/eJ6R4GRNrxLPwQUC5OdobTTPp5q8sq5f5taETl9JKM4O
	 s9/v0Cq8zMVFJcAtcDpisaNpncZfjrINeBd7NA/E3j99p5DYPJBey6eEXIPo4XXfYY
	 35M9WAsrh2MlgvTMefg3/gFTYO4ZlBI4HY+oVvRjlJpVaMW2D7PcMm5UZ1I2KakqOe
	 CbEQEB619CghQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Rong Bao <rong.bao@csmantle.top>,
	WANG Rui <wangrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH 6.12.y] perf annotate: Use jump__delete when freeing LoongArch jumps
Date: Fri,  1 May 2026 17:11:00 -0400
Message-ID: <20260501200000.item004-6.12@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501123717.4109458-1-rong.bao@csmantle.top>
References: <20260501123717.4109458-1-rong.bao@csmantle.top>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 01 May 2026 20:37:17 +0800, Rong Bao wrote:
> [ Upstream commit a355eefc36c4481188249b067832b40a2c45fa5c ]

Thanks, queued for 6.12.y.

--
Thanks,
Sasha
