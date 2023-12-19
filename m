Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C6C7486
	for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 06:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxVPDmNoFlUIUCAA--.12891S3;
	Tue, 19 Dec 2023 14:23:34 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxrnPjNoFl0d8LAA--.53871S4;
	Tue, 19 Dec 2023 14:23:33 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] docs, kprobes: Add loongarch as supported architecture
Date: Tue, 19 Dec 2023 14:23:30 +0800
Message-ID: <20231219062330.22813-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231219062330.22813-1-yangtiezhu@loongson.cn>
References: <20231219062330.22813-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxrnPjNoFl0d8LAA--.53871S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKr1fZry8Ar4DXrWUAw1UArc_yoW3KrXEk3
	sxXFZ5Cr4jgryjvws8tF4rJFsrZF4xuF15CrsrZr47Jw1Utw4DJFZ29a4qvFWxXrZruF18
	ArZ7XryqvFy2vosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0dgAUUUUU=

After the following three changes at the beginning of the year:

  commit 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
  commit 3f5536860086 ("LoongArch: Add kretprobes support")
  commit 09e679c28a4d ("LoongArch: Add kprobes on ftrace support")

it is appropriate to add loongarch as supported architecture in
kprobes documentation.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/trace/kprobes.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/trace/kprobes.rst b/Documentation/trace/kprobes.rst
index 968ae080accd..e1636e579c9c 100644
--- a/Documentation/trace/kprobes.rst
+++ b/Documentation/trace/kprobes.rst
@@ -321,6 +321,7 @@ architectures:
 - mips
 - s390
 - parisc
+- loongarch
 
 Configuring Kprobes
 ===================
-- 
2.42.0

