Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961BD270EDE;
	Tue, 20 May 2025 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736874; cv=none; b=jMrlSQTudQTZka/EROWrb186ps8Zla+40S7Ii7x84FkIPJuJXgjhBWGto4CyxLlI+BSDK+bM8VvG+K0+n1C7kUiCN9aDHgkjmxhutoejI2AHdeqPKbmvmgPjKses7AKFw7mHJN7jFZ3pwb/iWIJ+GAm6+Nyh5J2NDVN0pumj1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736874; c=relaxed/simple;
	bh=tDH99sUL7YDVc2eNE21Q0yZa7Foo6Ckjspz5MgPq3vk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=koo7gVJMZndCm5SQ7OYmLWkJ7eaEh68lhE3SbLMjVI8DVv4vIc/k4+kG8lQko2fFO4AqG6zvdH6bIWpY6sZp7FG6Tf7TekoySBQdhipdwTkLevn7TJWEUefeH1EsbMC5qkggapYeZ1MWQJBdhwa7n5txQ6hwOL8CKyb4ZNzVM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zxUWgRwh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zxUWgRwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD47C4CEEB;
	Tue, 20 May 2025 10:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747736874;
	bh=tDH99sUL7YDVc2eNE21Q0yZa7Foo6Ckjspz5MgPq3vk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=zxUWgRwhtPlPvQemJ+CBSdyWjFAeB/LXwfik/BQVxBWEZrWiU7kRlLWSApANg5Yv9
	 HnryEnPiREliLtVX2z//Rt+rzbkHTnxZ2xn9YRMi9FmqQMTfy5UQPDbLjsSo24/+dR
	 QPZDYlRf1YSdNGpop4kPsjivZ9vSVM3VhcT24vGY=
Subject: Patch "perf tools: Fix build error for LoongArch" has been added to the 6.14-stable tree
To: gregkh@linuxfoundation.org,loongarch@lists.linux.dev,yangtiezhu@loongson.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 20 May 2025 12:27:37 +0200
In-Reply-To: <20250520063009.23504-1-yangtiezhu@loongson.cn>
Message-ID: <2025052037-icky-flattery-a618@gregkh>
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

    perf tools: Fix build error for LoongArch

to the 6.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-tools-fix-build-error-for-loongarch.patch
and it can be found in the queue-6.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From yangtiezhu@loongson.cn  Tue May 20 11:10:01 2025
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Tue, 20 May 2025 14:30:09 +0800
Subject: perf tools: Fix build error for LoongArch
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Message-ID: <20250520063009.23504-1-yangtiezhu@loongson.cn>

From: Tiezhu Yang <yangtiezhu@loongson.cn>

There exists the following error when building perf tools on LoongArch:

  CC      util/syscalltbl.o
In file included from util/syscalltbl.c:16:
tools/perf/arch/loongarch/include/syscall_table.h:2:10: fatal error: asm/syscall_table_64.h: No such file or directory
    2 | #include <asm/syscall_table_64.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

This is because the generated syscall header is syscalls_64.h rather
than syscall_table_64.h. The above problem was introduced from v6.14,
then the header syscall_table.h has been removed from mainline tree
in commit af472d3c4454 ("perf syscalltbl: Remove syscall_table.h"),
just fix it only for the linux-6.14.y branch of stable tree.

By the way, no need to fix the mainline tree and there is no upstream
git id for this patch.

How to reproduce:

  git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
  cd linux && git checkout origin/linux-6.14.y
  make JOBS=1 -C tools/perf

Fixes: fa70857a27e5 ("perf tools loongarch: Use syscall table")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/arch/loongarch/include/syscall_table.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/perf/arch/loongarch/include/syscall_table.h
+++ b/tools/perf/arch/loongarch/include/syscall_table.h
@@ -1,2 +1,2 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscall_table_64.h>
+#include <asm/syscalls_64.h>


Patches currently in stable-queue which might be from yangtiezhu@loongson.cn are

queue-6.14/loongarch-uprobes-remove-user_-en-dis-able_single_step.patch
queue-6.14/loongarch-uprobes-remove-redundant-code-about-resume_era.patch
queue-6.14/perf-tools-fix-build-error-for-loongarch.patch
