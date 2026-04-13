Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8A33EB13;
	Mon, 13 Apr 2026 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081153; cv=none; b=TzyzdH+TBXuq4GbwmgmWdBA+E1STifmvy2zrVYK8VMq7xEQnzbA/V1Lz3qv1xW32ytkRs2V8LFiHMNevH5yideVp0p7WH6TqxzD0evyqG4y1FQuIEkNZGUiR9PnWidJbsG2QDXh+8/R4DAGE+xmiOt/3TExu4k6jQJTp2KWKiBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081153; c=relaxed/simple;
	bh=4vvYkp7OpVSgS4VLxSxO0wEDhEwE0SmnvoQ24ToT11I=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=SXv5amWL3UEpXBqnQB2Ros8ANnHb34xUG1OGtkoTmirZXyBDzE98fiXrpt5T05Qo2QJHgUEefBJDRHy1cQiMdlLyQBOnNMFd1G9zByxbKSLK7JQMyX3yv9pQS6MEbHJ5KvvhcuFX0LA9MHHaCuROrvEssNVSTBWn9qv2kaawLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nlEhMUZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nlEhMUZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAFFC116C6;
	Mon, 13 Apr 2026 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776081152;
	bh=4vvYkp7OpVSgS4VLxSxO0wEDhEwE0SmnvoQ24ToT11I=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=nlEhMUZzDLjbHjAICd2ZV+fA8Mm6rSh1+yhGf1Cdlbx4TlPKZFUciaQEX/4vNgoU0
	 eDX904fkgQoqLeRn67pw+Lx6U/u9ROvLKxEF4bhYsH66cRU70QehgXj/ugt1fXCO+0
	 XHpRPYTXG09fxS7OgXm7CY9MV7b2uutnKsrSlAM8=
Subject: Patch "LoongArch: Remove unnecessary checks for ORC unwinder" has been added to the 6.12-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org,yangtiezhu@loongson.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 13 Apr 2026 13:52:22 +0200
In-Reply-To: <20260413023627.1363488-1-chenhuacai@loongson.cn>
Message-ID: <2026041322-parachute-rift-9661@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    LoongArch: Remove unnecessary checks for ORC unwinder

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-remove-unnecessary-checks-for-orc-unwinder.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-235877-greg=kroah.com@vger.kernel.org Mon Apr 13 04:36:48 2026
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Mon, 13 Apr 2026 10:36:27 +0800
Subject: LoongArch: Remove unnecessary checks for ORC unwinder
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20260413023627.1363488-1-chenhuacai@loongson.cn>

From: Tiezhu Yang <yangtiezhu@loongson.cn>

[ Upstream commit 4cd641a79e69270a062777f64a0dd330abb9044a ]

According to the following function definitions, __kernel_text_address()
already checks __module_text_address(), so it should remove the check of
__module_text_address() in bt_address() at least.

int __kernel_text_address(unsigned long addr)
{
	if (kernel_text_address(addr))
		return 1;
	...
	return 0;
}

int kernel_text_address(unsigned long addr)
{
	bool no_rcu;
	int ret = 1;
	...
	if (is_module_text_address(addr))
		goto out;
	...
	return ret;
}

bool is_module_text_address(unsigned long addr)
{
	guard(rcu)();
	return __module_text_address(addr) != NULL;
}

Furthermore, there are two checks of __kernel_text_address(), one is in
bt_address() and the other is after calling bt_address(), it looks like
redundant.

Handle the exception address first and then use __kernel_text_address()
to validate the calculated address for exception or the normal address
in bt_address(), then it can remove the check of __kernel_text_address()
after calling bt_address().

Just remove unnecessary checks, no functional changes intended.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V2: Add upstream commit ID.

 arch/loongarch/kernel/unwind_orc.c |   16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -359,12 +359,6 @@ static inline unsigned long bt_address(u
 {
 	extern unsigned long eentry;
 
-	if (__kernel_text_address(ra))
-		return ra;
-
-	if (__module_text_address(ra))
-		return ra;
-
 	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;
@@ -382,10 +376,13 @@ static inline unsigned long bt_address(u
 			break;
 		}
 
-		return func + offset;
+		ra = func + offset;
 	}
 
-	return ra;
+	if (__kernel_text_address(ra))
+		return ra;
+
+	return 0;
 }
 
 bool unwind_next_frame(struct unwind_state *state)
@@ -511,9 +508,6 @@ bool unwind_next_frame(struct unwind_sta
 		goto err;
 	}
 
-	if (!__kernel_text_address(state->pc))
-		goto err;
-
 	preempt_enable();
 	return true;
 


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.12/loongarch-remove-unnecessary-checks-for-orc-unwinder.patch
queue-6.12/loongarch-handle-percpu-handler-address-for-orc-unwinder.patch
