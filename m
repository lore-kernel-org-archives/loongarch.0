Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C113ADD
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 18:49:03 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DF62A2DC;
	Fri, 14 Jul 2023 18:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DF62A2DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1689360200; bh=Bon09mDec0urmze6A54Y2o0448k0+MpKSg6TVjXG9To=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lu/g8sRPv5SNvVNKReUrV1WPAeOeQ5DQQ/bg7mLy28xrFc+z7k91E2MOwDuNUXIqE
	 jHTeOK4XWFlx4Rdnh/lqIyWHMo37F2ngTIyzMdEwgGwx53CZ62ROUIUJORcSmkp4WM
	 de73dQN4F4XGWlLMlwz6OxaeEQpxvY4rIbcmrbkRK4WJDQ0H9cquA+Y2Uf9YcF+zSF
	 QYfLPqjn1l+KfYTMf0Z4ypa+csKDiT7Qlb9QFhwx/VsZYFG4VyvV43dW42Nz8BKYKt
	 ULv/uq7yOrgsqnLUe90UmrVVqxOkAGwr9Hg55u7fjsOCkT31lzZQNp8cfsWGEs/Cgg
	 LT9cIE/KizO0g==
From: Jonathan Corbet <corbet@lwn.net>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-doc@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 0/2] Update Documentation/features
In-Reply-To: <1689060720-4628-1-git-send-email-yangtiezhu@loongson.cn>
References: <1689060720-4628-1-git-send-email-yangtiezhu@loongson.cn>
Date: Fri, 14 Jul 2023 12:43:19 -0600
Message-ID: <87bkge1ghk.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Tiezhu Yang <yangtiezhu@loongson.cn> writes:

> This patch series is based on 6.5-rc1, it also applies cleanly to
> DOCUMENTATION tree: git.lwn.net/linux.git docs-next
>
> Tiezhu Yang (2):
>   Documentation/features: Check ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>   Documentation/features: Refresh support files for 6.5
>
>  Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
>  Documentation/features/debug/kprobes/arch-support.txt           | 2 +-
>  Documentation/features/debug/kretprobes/arch-support.txt        | 2 +-
>  Documentation/features/debug/stackprotector/arch-support.txt    | 2 +-
>  Documentation/features/debug/uprobes/arch-support.txt           | 2 +-
>  Documentation/features/locking/lockdep/arch-support.txt         | 2 +-
>  Documentation/features/vm/ELF-ASLR/arch-support.txt             | 5 +++--
>  7 files changed, 9 insertions(+), 8 deletions(-)
>

Series applied, thanks.

jon
