Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B12F39A9;
	Thu, 18 Dec 2025 23:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766102302; cv=none; b=G6qd08q3Bc2i8GWWswgxA21lCVXQmaP+m+t6LF+VOxKRqKk/lIORnvKsfbXjVC4S+L1yKdew2dKHwEc9s4W6xzj4ThgDZifm/F8P2zZVjwHB2COQYfgwTB0XwLByL0vX+g1eA9raPW71MRaHGCu1JQ3+hTU6TbElA9bKnobFiQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766102302; c=relaxed/simple;
	bh=pOn3UTGNCr6gmFU7RxZHh2NZLgeMIttvJru0dCb1H1M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gGu3tJyTwAmSbDeDWFBkOeK/0BL/erk8ac3rOddf8oaYwx4OvSnu8WtJ5BIKaJaPBiHVR1WSbw5wqFcvuIo6wquNCiky/qqeBWouRiWwLQju3tNTHd4107E029o7Vpc01uho0+wuiH+KgoEf18U3vxspsEtDMwVz0yAZ22CqdAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zoDH5EiM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zoDH5EiM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0087C4CEFB;
	Thu, 18 Dec 2025 23:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766102302;
	bh=pOn3UTGNCr6gmFU7RxZHh2NZLgeMIttvJru0dCb1H1M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zoDH5EiMwoBZY4/l3xdzNG7igyTT2ee76o7UEog+gPVKWyzyP+R3uiwNBrOUV1x21
	 x4xqGKcupy93UJd+zwJSQpPwhdkutqaSJZWeyVDJFXGwY+M0Sz6vafNoHGO/uZuPu9
	 h36x8YYM+XF9tZO3N9TRdwRxzpJ+3VTgbi2WtI8Y=
Date: Thu, 18 Dec 2025 15:58:21 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: yuan linyu <yuanlinyu@honor.com>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <loongarch@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] kfence: allow change number of object by early
 parameter
Message-Id: <20251218155821.92454cbb7117c27c1b914ce0@linux-foundation.org>
In-Reply-To: <20251218015849.1414609-4-yuanlinyu@honor.com>
References: <20251218015849.1414609-1-yuanlinyu@honor.com>
	<20251218015849.1414609-4-yuanlinyu@honor.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 09:58:49 +0800 yuan linyu <yuanlinyu@honor.com> wrote:

> when want to change the kfence pool size, currently it is not easy and
> need to compile kernel.
> 
> Add an early boot parameter kfence.num_objects to allow change kfence
> objects number and allow increate total pool to provide high failure
> rate.
> 
> ...
>
>  include/linux/kfence.h  |   5 +-
>  mm/kfence/core.c        | 122 +++++++++++++++++++++++++++++-----------
>  mm/kfence/kfence.h      |   4 +-
>  mm/kfence/kfence_test.c |   2 +-

Can you please add some documentation in Documentation/dev-tools/kfence.rst?

Also, this should be described in
Documentation/admin-guide/kernel-parameters.txt.  That file doesn't
mention kfence at all, which might be an oversight.

Meanwhile, I'll queue these patches in mm.git's mm-nonmm-unstable
branch for some testing.  I'll await reviewer input before proceeding
further.  Thanks.
