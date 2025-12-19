Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3C288D2;
	Fri, 19 Dec 2025 00:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766102913; cv=none; b=RjcP+tEHr8jsLmv76c2o5VjVaAADHnmc+8T7g8ljBAmQwQ9deC1EBNd0yp/Yi9QW+AO+u2P7c8ON3nEIAAkaakLwumGZxq9K2+cMLqK3NWj9gaqzz1Ub4nwrjgOlIlMdpOF2qv+BgIO0hpDz1471oY2MRWmvgdb6LVDo5UNNhAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766102913; c=relaxed/simple;
	bh=Om4RAVVJQdKfwzKaJj92V+UB8EodP6GhuAZCtWgLCCs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tNlCIFqO3YT5urUQtGMULOVvR4nAKSuM9Eh9M3fB6NKr3RRQdh++hrgiod0N5c1YX2fgQHSoBdQxpc6kuPpWvnfYCkQPhk5uqcPo8MBoX62lTofqDjJIk3tjmCjvVzTQzUWAietZUI2NF9D+yA7BDl/enTmxGKbpDKg5ACB6GN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uPNsSIZ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uPNsSIZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F70BC116C6;
	Fri, 19 Dec 2025 00:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766102912;
	bh=Om4RAVVJQdKfwzKaJj92V+UB8EodP6GhuAZCtWgLCCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uPNsSIZ35o4md4V6dNrHSmME7WdL0qZV7StG1dvRRrfv70KLhICGld/Z6aS9TUBi0
	 bwNgeQsJrc/znWiM5RFkc3d830x+g7jPUkxG9wM5yboGvnNQjEjVZf/JqvVeW9eT3y
	 PoMtQcFGXmwls+EbpnsoAgI0mkZ7il26mCQ/ZDfA=
Date: Thu, 18 Dec 2025 16:08:31 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Marco Elver <elver@google.com>
Cc: yuan linyu <yuanlinyu@honor.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kfence: allow change number of object by early
 parameter
Message-Id: <20251218160831.566ae0c0e349e4d563c96c16@linux-foundation.org>
In-Reply-To: <CANpmjNP1tMwdOUTNEqqTmWR2Ki8yDQ+H13iSHxzLkomj-WComQ@mail.gmail.com>
References: <20251218015849.1414609-1-yuanlinyu@honor.com>
	<20251218015849.1414609-4-yuanlinyu@honor.com>
	<20251218155821.92454cbb7117c27c1b914ce0@linux-foundation.org>
	<CANpmjNP1tMwdOUTNEqqTmWR2Ki8yDQ+H13iSHxzLkomj-WComQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Dec 2025 01:03:11 +0100 Marco Elver <elver@google.com> wrote:

> > >  include/linux/kfence.h  |   5 +-
> > >  mm/kfence/core.c        | 122 +++++++++++++++++++++++++++++-----------
> > >  mm/kfence/kfence.h      |   4 +-
> > >  mm/kfence/kfence_test.c |   2 +-
> >
> > Can you please add some documentation in Documentation/dev-tools/kfence.rst?
> >
> > Also, this should be described in
> > Documentation/admin-guide/kernel-parameters.txt.  That file doesn't
> > mention kfence at all, which might be an oversight.
> >
> > Meanwhile, I'll queue these patches in mm.git's mm-nonmm-unstable
> > branch for some testing.  I'll await reviewer input before proceeding
> > further.  Thanks.
> 
> Note, there was an v2 sent 5 hours after this v1, which I had
> commented on here:
> https://lore.kernel.org/all/aUPB18Xeh1BhF9GS@elver.google.com/

Ah, OK, thanks, I confused myself.  I'll drop the v1 series and shall
await a v3!
